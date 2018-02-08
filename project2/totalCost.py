"""
To run this script, type

  python totalCost.py

Once you have correctly implemented the totalCost function,
the script should produce the output:

Cost of [('apples', 2.0), ('pears', 3.0), ('limes', 4.0)] is 12.25
"""

fruitPrices = {'apples':2.00, 'oranges': 1.50, 'pears': 1.75,
              'limes':0.75, 'strawberries':1.00}

def totalCost(orderList):
    """
        orderList: List of (fruit, numPounds) tuples

    Returns cost of order
    """
    total = 0.0
    "*** YOUR CODE HERE ***"
    for fruits in orderList:
        price_of_fruit = fruitPrices[fruits[0]]
        total += price_of_fruit*fruits[1] 
    return total

# Main Method
if __name__ == '__main__':
    "This code runs when you invoke the script from the command line"
    orderList = [ ('apples', 2.0), ('pears', 3.0), ('limes', 4.0) ]
    print('Cost of '+ str(orderList)+ ' is '+ str(totalCost(orderList)))
