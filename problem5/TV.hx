/*
* a tv can be in color or black and white and in 4k or regular resolution
* TASK:
*   Refactor to improve the extensibility of the class, add in a SUPER COLOR option
*/

class TV
{
    public static function main() : Void
    {
        for (tv in [new TV("old", false, true), new TV("hd", true, true), new TV("normal", false, true)]){
            tv.render();
            trace("$" + tv.sellPrice());
        }
    }

    private static var BASIC_SELL_PRICE:Int = 1000;

    private var name:String;
    private var _is4k:Bool;
    private var _isColor:Bool;

    public function new(name:String, is4k:Bool, isColor:Bool)
    {
        this.name = name;
        _is4k = is4k;
        _isColor = isColor;
    }

    public function render():Void
    {
        if(_is4k) trace("rendering 4k");
        if(_isColor) trace("rendering color")
        else trace("rendering black and white");
    }


    public function sellPrice():Int
    {
        var price = BASIC_SELL_PRICE;
        if(_isColor) price -= 900;
        if(_is4k) price *= 2;
        return price;
    }


    public function describe():String
    {
        return name;
    }
}
