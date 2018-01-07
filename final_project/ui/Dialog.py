# -*- coding: utf-8 -*-

"""
Module implementing Dialog.
"""

from PyQt5.QtCore import pyqtSlot
from PyQt5.QtWidgets import QDialog

from .Ui_Dialog import Ui_Dialog

class Dialog(QDialog, Ui_Dialog):
    """
    Class documentation goes here. (若有類別相關說明文件內容, 放在此處)
    """
    def __init__(self, parent=None):
        """
        Constructor (類別建構子)
 
        @param parent reference to the parent widget
        @type QWidget
        """
        super(Dialog, self).__init__(parent)
        self.setupUi(self)
        num_button = [self.one,  self.two,  \
        self.three,  self.four,  self.five,  self.six,  self.seven,  self.eight,  self.nine,  self.zero]
        plus_minus = [self.plusButton,  self.minusButton]
        multiply_divide = [self.timesButton,  self.divisionButton]
        for i in num_button:
            i.clicked.connect(self.digitClicked)
        for i in plus_minus:
            i.clicked.connect(self.additiveOperatorClicked)
        self.equalButton.clicked.connect(self.equalClicked)
        self.clearButton.clicked.connect(self.clear)
        self.clearAllButton.clicked.connect(self.clearAll)
        self.clearMemoryButton.clicked.connect(self.clearMemory)
        self.readMemoryButton.clicked.connect(self.readMemory)
        self.setMemoryButton.clicked.connect(self.setMemory)
        self.pointButton.clicked.connect(self.pointClicked)
        self.changeSignButton.clicked.connect(self.changeSignClicked)
        self.backspaceButton.clicked.connect(self.backspaceClicked)
        self.addToMemoryButton.clicked.connect(self.addToMemory)
        unaryOperator = [self.squareRootButton, self.powerButton,  self.reciprocalButton ]
        for i in unaryOperator:
            i.clicked.connect(self.unaryOperatorClicked)
 
        for i in multiply_divide:
            i.clicked.connect(self.multiplicativeOperatorClicked)
 
        self.pendingAdditiveOperator = ''
        self.sumSoFar = 0.0
        self.waitingForOperand = True
        self.sumInMemory = 0.0
        self.factorSoFar = 0.0
        self.pendingMultiplicativeOperator = ''
 
    def digitClicked(self):
        clickedButton = self.sender()
        digitValue = int(clickedButton.text())
        if self.display.text() == '0' and digitValue == 0.0:
            return
        if self.waitingForOperand:
            self.display.clear()
            self.waitingForOperand = False
        self.display.setText(self.display.text() + str(digitValue))
 
    def additiveOperatorClicked(self):
        clickedButton = self.sender()
        clickedOperator = clickedButton.text()
        operand = float(self.display.text())
 
        if self.pendingMultiplicativeOperator:
            if not self.calculate(operand, self.pendingMultiplicativeOperator):
                self.abortOperation()
                return
 
            self.display.setText(str(self.factorSoFar))
            operand = self.factorSoFar
            self.factorSoFar = 0.0
            self.pendingMultiplicativeOperator = ''
 
        if self.pendingAdditiveOperator:
            if not self.calculate(operand, self.pendingAdditiveOperator):
                self.abortOperation()
                return
            self.display.setText(str(self.sumSoFar))
        else:
            self.sumSoFar = operand
 
        self.pendingAdditiveOperator = clickedOperator
        self.waitingForOperand = True
        
    def multiplicativeOperatorClicked(self):
        clickedButton = self.sender()
        clickedOperator = clickedButton.text()
        operand = float(self.display.text())
        if self.pendingMultiplicativeOperator:
            if not self.calculate(operand, self.pendingMultiplicativeOperator):
                self.abortOperation()
                return
            self.display.setText(str(self.factorSoFar))
        else:
            self.factorSoFar = operand
        self.pendingMultiplicativeOperator = clickedOperator
        self.waitingForOperand = True
 
    def unaryOperatorClicked(self):
        clickedButton = self.sender()
        clickedOperator = clickedButton.text()
        operand = float(self.display.text())
 
        if clickedOperator == "Sqrt":
            if operand < 0.0:
                self.abortOperation()
                return
 
            result = math.sqrt(operand)
        elif clickedOperator == "X^2":
            result = math.pow(operand, 2.0)
        elif clickedOperator == "1/x":
            if operand == 0.0:
                self.abortOperation()
                return
 
            result = 1.0 / operand
 
        self.display.setText(str(result))
        self.waitingForOperand = True
 
    def equalClicked(self):
        operand = float(self.display.text())
 
        if self.pendingMultiplicativeOperator:
            if not self.calculate(operand, self.pendingMultiplicativeOperator):
                self.abortOperation()
                return
            operand = self.factorSoFar
            self.factorSoFar = 0.0
            self.pendingMultiplicativeOperator = ''
        if self.pendingAdditiveOperator:
            if not self.calculate(operand, self.pendingAdditiveOperator):
                self.abortOperation()
                return
 
            self.pendingAdditiveOperator = ''
        else:
            self.sumSoFar = operand
 
        self.display.setText(str(self.sumSoFar))
        self.sumSoFar = 0.0
        self.waitingForOperand = True
        
    def calculate(self, rightOperand, pendingOperator):
        if pendingOperator == "+":
            self.sumSoFar += rightOperand
 
        elif pendingOperator == "-":
            self.sumSoFar -= rightOperand
 
        elif pendingOperator == "*":
            self.factorSoFar *= rightOperand
 
        elif pendingOperator == "/":
            if rightOperand == 0.0:
                return False
 
            self.factorSoFar /= rightOperand
 
        return True
 
 
    def pointClicked(self):
        if self.waitingForOperand:
            self.display.setText('0')
 
        if "." not in self.display.text():
            self.display.setText(self.display.text() + ".")
 
        self.waitingForOperand = False
 
    def changeSignClicked(self):
        text = self.display.text()
        value = float(text)
 
        if value > 0.0:
            text = "-" + text
        elif value < 0.0:
            text = text[1:]
 
        self.display.setText(text)
 
    def backspaceClicked(self):
        if self.waitingForOperand:
            return
 
        text = self.display.text()[:-1]
        if not text:
            text = '0'
            self.waitingForOperand = True
 
        self.display.setText(text)

    def clear(self):
        if self.waitingForOperand:
            return
 
        self.display.setText('0')
        self.waitingForOperand = True
 
    def clearAll(self):
        self.sumSoFar = 0.0
        self.factorSoFar = 0.0
        self.pendingAdditiveOperator = ''
        self.pendingMultiplicativeOperator = ''
        self.display.setText('0')
        self.waitingForOperand = True
 
    def clearMemory(self):
        self.sumInMemory = 0.0
 
    def readMemory(self):
        self.display.setText(str(self.sumInMemory))
        self.waitingForOperand = True
 
    def setMemory(self):
        self.equalClicked()
        self.sumInMemory = float(self.display.text())
 
    def addToMemory(self):
        self.equalClicked()
        self.sumInMemory += float(self.display.text())
 
    def abortOperation(self):
        self.clearAll()
        self.display.setText("####")
