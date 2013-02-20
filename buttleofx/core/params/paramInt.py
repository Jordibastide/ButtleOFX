from quickmamba.patterns import Signal
# undo redo
from buttleofx.core.undo_redo.manageTools import CommandManager
from buttleofx.core.undo_redo.commands.params import CmdSetParamInt


class ParamInt(object):
    """
        Core class, which represents an int parameter.
        Contains :
            - _tuttleParam : link to the corresponding tuttleParam.
            - _oldValue : the old value of the param.
            - changed : signal emitted when we set value(s) of the param.
    """

    def __init__(self, tuttleParam):
        self._tuttleParam = tuttleParam

        self._oldValue = self.getValue()

        self.changed = Signal()

    #################### getters ####################

    def getTuttleParam(self):
        return self._tuttleParam

    def getParamType(self):
        return "ParamInt"

    def getDefaultValue(self):
        return self._tuttleParam.getProperties().getIntProperty("OfxParamPropDefault")

    def getOldValue(self):
        return self._oldValue

    def getValue(self):
        return self._tuttleParam.getIntValue()

    def getMinimum(self):
        return self._tuttleParam.getProperties().getIntProperty("OfxParamPropDisplayMin")

    def getMaximum(self):
        return self._tuttleParam.getProperties().getIntProperty("OfxParamPropDisplayMax")

    def getText(self):
        return self._tuttleParam.getName()[0].capitalize() + self._tuttleParam.getName()[1:]
        
    def isSecret(self):
        return self._tuttleParam.getSecret()

    #################### setters ####################

    def setOldValue(self, value):
        self._oldValue = value

    # distinction between setValue and pushValue, because it's a slider : we do not push a command until the user don't release the cursor (but we update the model).

    def setValue(self, value):
        self._tuttleParam.setValue(int(value))
        self.changed()

    def pushValue(self, newValue):
        if newValue != self.getOldValue():
            cmdUpdate = CmdSetParamInt(self, int(newValue))
            cmdManager = CommandManager()
            cmdManager.push(cmdUpdate)
