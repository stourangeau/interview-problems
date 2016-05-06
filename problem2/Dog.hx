/*
* PetDog has a full name (first and last) and optionally has puppies.
* When we rename the dog, we also want to rename the puppies last names
* Refactor this so it isn't shit
*/

class Dog
{

    public static function main() : Void {
        var pet = new Dog("Walter White");
        var pup = pet.addPup("Junior White");
        pet.setName("Walter Heisenberg");
        
        trace(pup.name);
    }


    public var name:String;
    private var _puppies:Array<Dog>;

    public function new(name:String)
    {
        _puppies = [];
        setName(name);
    }


    public function addPup(name:String):Dog
    {
        var pup = new Dog(name);
        _puppies.push(pup);
        setName(name);
        return pup;
    }


    public function setName(name:String):Void
    {
        this.name = name;
        var last = name.split(" ")[1];

        //update the puppies names to have the same last name
        for(pup in _puppies) {
            pup.setName(pup.name.split(" ")[0] + " " + last);
        }
    }


    public function getPuppies():Array<Dog>
    {
        return _puppies;
    }

}
