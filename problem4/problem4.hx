/*
* We have a Thing which can doSomething(). Each thing has a thingDoer, which defines what doSomething does.
*/

class Thing
{
    public static function main() : Void {
        var prom = new Promise<String>();
        var doer = new ThingDoer();
        var thing = new Thing(1);

        var t = new haxe.Timer(1000);

        doer.doThing(thing, prom);
        haxe.Timer.delay( function() { Math.random() < 0.5 ? prom.setSuccess("succeeded") : prom.setFailure(); }, 1000);
    }


  private var _t:String;
  private var _doer:IDoer;

  public function new()
  {
    _doer = getDoer();
  }


  public function doSomething(thenTrace:String)
  {
      _t = thenTrace;
      _doer.do();
  }


  private function onSomethingDone():Void
  {
      trace(_t);
  }


  private function getDoer():IDoer
  {
    return new ThingDoer(onSomethingDone);
  }

}


class ThingDoer implments IDoer
{
  private var _callback:Void->Void;

  public function new(whenDone:Void->Void)
  {
      _callback = whenDone;
  }

  public function do():Void
  {
      Timer.delay(done, 1000);
  }

  public function done():Void
  {
    trace("Done");
    _callback();
  }
}
