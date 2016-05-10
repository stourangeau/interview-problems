/*
  ThingDoer takes a thing, and a promise, and does the thing when the promise succeeds.

  TASK:
    1. Identify potential errors in the code
    2. Refactor to remove all errors
    3. Write tests to validate you have no errors
*/

class ThingDoer
{
    public static function main() : Void {
        var prom = new Promise<String>();
        var doer = new ThingDoer();
        var thing = new Thing(1);

        var t = new haxe.Timer(1000);

        doer.doThing(thing, prom);
        haxe.Timer.delay( function() { Math.random() < 0.5 ? prom.setSuccess("succeeded") : prom.setFailure(); }, 1000);
    }


    public var didThing:Bool;
    private var _thing:IThing;

    public  function new() : Void {}

    public function doThing<T>(thing:IThing, promise:Promise<T> = null):Void
    {
        _thing = thing;
        if(promise == null) onSetComplete();
        promise.onSuccess(onSetComplete);
        promise.onFailure(onFailure);
    }


    public function isDoingThing():Bool
    {
        return _thing != null && !didThing;
    }


    private function onSetComplete():Void
    {
        _thing.doThing();
        _thing = null;
        didThing = true;
    }


    private function onFailure():Void
    {
        trace("failed");
        _thing = null;
    }
}


class Thing implements IThing
{
    private var _value:Int;

    public function new(value:Int) : Void
    {
        _value = value;
    }

    public function doThing() : Void
    {
        trace("DID THING!" + _value);
    }
}


interface IThing
{
    public function doThing():Void;
}


class Promise<T>
{
    public  var didSucceed:Bool;
    public  var isComplete:Bool;

    private var _value:Null<T>;
    private var _success:Void->Void;
    private var _failure:Void->Void;

    public function new():Void
    {
        didSucceed = false;
    }

    public function setSuccess(value:T) : Void
    {
        _value = value;
        didSucceed = true;
        if(_success != null) _success();
    }

    public function setFailure() : Void
    {
        didSucceed = false;
        if(_failure != null) _failure();
    }

    public function onFailure(callback:Void->Void) : Void
    {
        _failure = callback;
    }

    public function onSuccess(callback:Void->Void) : Void
    {
        _success = callback;
        if(didSucceed) _success();
    }

    public function getValue() :T
    {
        if(!didSucceed) throw "can't get value of failed future";
        return _value;
    }

    public function hasComplete() :T
    {
        return _value != null;
    }
}
