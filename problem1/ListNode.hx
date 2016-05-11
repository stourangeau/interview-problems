/*
* Basic implementation of linked list, with a middleNode function.
*
* TASK:
*  Improve the efficiency of the middle node function
*/

class ListNode
{


    public static function main() : Void
    {
        var prev = new ListNode(0);
        var start = prev;
        for(i in 1...100){
            var n = new ListNode(i);
            prev.next = n;
            prev = n;
        }

        trace(ListNode.middleNode(start).value);
    }

    public var value:Float;
    public var next:ListNode;

    public function new(value:Float) : Void {
        this.value = value;
    }

    // returns the median node, from given node to the end of the list
    public static function middleNode(head:ListNode):ListNode
    {
        var middleNode = head;
        var node = head;

        while (node.next != null)
		{
            node = node.next;
		    middleNode = middleNode.next;				

			if (node.next != null)
			{
				node = node.next;
			}
        }

        return middleNode;
    }

    // returns the numbe of nodes in the list
    public static function length(head:ListNode):Int
    {
        var length = 1;
        while(head.next != null){
            length ++;
            head = head.next;
        }
        return length;
    }
}
