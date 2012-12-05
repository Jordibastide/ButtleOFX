class Node(object):

    """
        Class Node defined by:
        - name
        - x : Node position on the x axis
        - y : Node position on the y axis
        - r : Value for the red color
        - g : Value for the green color
        - b : Value for the blue color
        - nbInput

        Creates a python object Node.
    """

    def __init__(self, name, x, y, r, g, b, nbInput):
        super(Node, self).__init__()
        self.name = name
        self.x = x
        self.y = y
        self.r = r
        self.g = g
        self.b = b
        self.nbInput = nbInput

    def __str__(self):
        return 'Node "%s"' % (self.name)