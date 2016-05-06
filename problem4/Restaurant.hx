/*
The EventDispatcher here is identicle to AS3s event dispatcher.
http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/events/EventDispatcher.html

The waiters job is to deliver food to people at the table.
In this model, the waiter only remembers names, orders and table numbers. If there are two customers with the same name and table he will confuse them. Thats part of the design.
The waiter should not mix up anything else

TASK:
    1. Identify all the problems in this code
    2. Refactor the code so all problems are fixed
    3. Write test cases to check your refactor
*/

import flash.events.Event;
import flash.events.EventDispatcher;

class Restaurant
{
    public static function main() : Void {
        var w = new Waiter();

        new Customer(1, "john", w, ["carrot", "spaghetti", "milk"]);
        new Customer(1, "sarah", w, ["chicken", "rice", "water"]);
    }
}

class Customer
{
  private var waiter:Waiter;

  public function new(table:Int, name:String, waiter:Waiter, orders:Array<String>)
  {
      waiter = new Waiter();
      for(o in orders){
          waiter.addEventListener(o, function(e:WaiterEvent) if(e.table == table && e.name == name) trace(name + " at table " + table + " is eating some delicious " + o));
          waiter.requestFood(table, name, o);
      }
  }
}


class Waiter extends EventDispatcher
{

  public function new():Void
  {
      super();
  }

  public function requestFood(table:Int, name:String, food:String):Void
  {
      haxe.Timer.delay(
        function(){ dispatchEvent(new WaiterEvent(table, name, food)); },
        Math.round(Math.random() * 2000));
  }
}

class WaiterEvent extends Event
{
  public var table:Int;
  public var name:String;

  public function new (table:Int, name:String, food:String){
      super(food);
      this.table = table;
      this.name = name;
  }
}
