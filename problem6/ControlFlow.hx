/*
TASK: Improve the readability of this class
*/

class ControlFlow
{

  public static function main():Void
  {
      var cond1 = true;
      var cond2 = false;
      var cond3 = false;

      if(cond1){
        trace("1");

        if(cond3 && cond2){
          trace("2");
        }
        else if(cond2){
          trace("3");
        }

      }
      else if(cond2 && cond3){
        trace("4");
      }
      else if(cond3){
        trace("5");
      }else {
        if(!cond1 || !cond3){
            trace("6");
        }
      }
  }
}
