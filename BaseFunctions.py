# ----------------------------------------------------------------------------------------------------
# Module Name: Base Function Class Module
# Module Description: This class uses the base functions to set, get, and delete objects in each class 
# hierarchy 
# ----------------------------------------------------------------------------------------------------

# Import Python Libraries
from datetime import datetime, timedelta, date
from dateutil.relativedelta import relativedelta
import hashlib
import os
import subprocess
import sys
import pandas as pd
from pandas import ExcelWriter
import pyodbc
from tkinter import *
from tkinter import messagebox, filedialog
import re

# Import Project Modules
from QueryClass import SQLQueries

class BaseFunctions():
    """
    Class Name: BaseFunctions
    Class Description: This class validates, checks, sets, and gets any class object passed to each function 
    """    

    def Validate_Serial_Input(strInput):
        """
        Function Name: Validate_Serial_Input
        Function Purpose: This function validates the user serial number inputs
        """    
        # Declare Local Variable
        global blnValidated
        blnValidated = False
        chrPattern = r'[-+*#_]'
        strInput = str(strInput)

        # Validation function
        try:
            # Validate the String to determine if the string is not empty, either contains numbers, letters,
            # both numbers and letters, or numbers, letters, and a symbol
            if (strInput.isalpha()):
                blnValidated = True
            elif (strInput.isdigit()):
                blnValidated = True
            elif (strInput.isalnum()):
                blnValidated = True
            else:
                # Use the Regex function to find the given pattern. Return blnValidated as true if any of these
                # characters are found in the serial number
                Result = re.findall(chrPattern, strInput)
                if (Result != None):
                    blnValidated = True
                # Neither of the symbols were found and the input is not valid
                else:
                    print("Invalid input.\n")
                    blnValidated = False

        except ValueError:
            # Set value to empty string
            strInput = str("")
            blnValidated = False
            chrPattern = r'[-+*#_]'

        # Return String Input
        return blnValidated

    def Validate_PrimaryKey_Input(intInput):
        """
        Function Name: Validate_PrimaryKey_Input
        Function Purpose: This function validates the user integer value that is greater than zero
        """ 
        # Declare Local Variable
        global blnValidated
        blnValidated = False
        intInput = int(intInput)

        # Try and Except Validation function
        try:
            # Validate the integer value to determine if the integer is empty or is zero or less
            if (intInput > 0):
                blnValidated = True
            elif (intInput == ''):
                print("Invalid input. Input should not be empty.\n")
                blnValidated = False
            else:
                print("Invalid input. Input must be 0 or greater.\n")
                blnValidated = False
        except ValueError:
            # Set value to zero
            intInput = int(0)
            print("Input must be numeric.\n")

        # Return Integer value Input
        return blnValidated

    def Validate_Date_Input(strInput):
        """
        Function Name: Validate_Date_Input
        Function Purpose: This function validates the Date entered by the user
        """         
        # Declare Local Variable
        global blnValidated
        blnValidated = False
        strInput = str(strInput)
        dtmDate = datetime.strptime(strInput, '%m/%d/%Y')
        dtmCurrentDate = datetime.now()

        # Try and Except Validation function
        try:
            # Validate the string value to determine if the date is empty or contains any symbols not required
            if (dtmDate <= dtmCurrentDate):
                blnValidated = True
            else:
                print("Invalid input. Date was out of range.\n")
                blnValidated = False
        except ValueError:
            # Set value to zero
            strInput = str("")
            print("Input must be a date that exists and formatted as (mm/dd/yyyy).\n")

        # Return blnValidated status
        return blnValidated


    # ----------------------------------------------------------------------------------------------------
    # Function Name: Remaining_Attempts
    # Function Purpose: This function reminds the user about the number of attempts remaining to input a 
    # valid condition
    # ----------------------------------------------------------------------------------------------------
    def Remaining_Attempts(intIndex):
        # Declare Local Variables
        intEXIT_COUNT = int(5)

        # Increment the index and set intUserInput to zero
        intIndex += 1
        
        # Display to the user the number of remaining attempts
        print("You have %d remaining attempts remaining.\n" % (intEXIT_COUNT - intIndex))
        
        # return the index
        return intIndex 

    def Validate_Password_Length(strInput):
        """ 
        Function Name: Validate_Password_Length
        Function Description: This function validates the user password length
        """
        # Declare Local Variable
        global blnValidated
        blnValidated = False
        strInput = str(strInput)
        intMIN_STRING_LENGTH = int(4)

        # Try and Except Validation length of string
        try:
            # Validate the string length
            if (len(strInput) >= intMIN_STRING_LENGTH):
                blnValidated = True
            else:
                blnValidated = False
        except ValueError:
            # Initialize the variables
            strInput = str("")
            intMIN_STRING_LENGTH = int(4)

        # Return Validation status
        return blnValidated

    def Validate_CapitalChar(strInput):
        """ 
        Function Name: Validate_CapitalChar
        Function Description: This function validates the user password capital parameter
        """        
        # Declare Local Variable
        global blnValidated
        blnValidated = bool(False)
        strInput = str(strInput)
        aInputList = []
        aCapList = list(map(chr, range(65, 91)))

        # Try and Except Validation of all required characters of string
        try:
            # Split the password input into separate characters inside a list array
            for lst in strInput.strip():
                aInputList.append(lst)

            # Validate the string password holds the correct parameters for character authentication
            # Check if the password has a capital letter character
            for check in aCapList:
                if (check in aInputList):
                    blnValidated = bool(True)
                    break
                else:
                    blnValidated = bool(False)

        except ValueError:
            # Set value to zero
            blnValidated = bool(False)
            strInput = str(strInput)
            aInputList = []
            print("Whoops. Input was invalid.\n")

        # Return Validation status
        return blnValidated

    def Validate_First_SymbolChar(strInput):
        """ 
        Function Name: Validate_First_SymbolChar
        Function Description: This function validates the user password symbol parameter
        """     
        # Declare Local Variable
        global blnValidated
        blnValidated = bool(False)
        strInput = str(strInput)
        aInputList = []
        aSymListOne = list(map(chr, range(33, 48)))

        # Try and Except Validation of all required characters of string
        try:
            # Split the password input into separate characters inside a list array
            for lst in strInput.strip():
                aInputList.append(lst)

            # Check if the password has a the correct special character
            for check in aSymListOne:
                if (check in aInputList):
                    blnValidated = bool(True)
                    break
                else:
                    blnValidated = bool(False)

        except ValueError:
            # Set value to zero
            blnValidated = bool(False)
            aSymListOne = list(map(chr, range(33, 48)))
            strInput = str(strInput)
            aInputList = []

        # Return Validation status
        return blnValidated

    def Validate_Second_SymbolChar(strInput):
        """ 
        Function Name: Validate_Second_SymbolChar
        Function Description: This function validates the user password symbol parameter
        """          
        # Declare Local Variable
        global blnValidated
        blnValidated = bool(False)
        strInput = str(strInput)
        aInputList = []
        aSymListTwo = list(map(chr, range(58, 65)))

        # Try and Except Validation of all required characters of string
        try:
            # Split the password input into separate characters inside a list array
            for lst in strInput.strip():
                aInputList.append(lst)

            # Check if the password has a the second correct special character
            for check in aSymListTwo:
                if (check in aInputList):
                    blnValidated = bool(True)
                    break
                else:
                    blnValidated = bool(False)

        except ValueError:
            # Set value to zero
            blnValidated = bool(False)
            aSymListTwo = list(map(chr, range(58, 65)))
            strInput = str(strInput)
            aInputList = []

        # Return Validation status
        return blnValidated

    def Validate_Third_SymbolChar(strInput):
        """ 
        Function Name: Validate_Third_SymbolChar
        Function Description: This function validates the user password symbol parameter
        """                  
        # Declare Local Variable
        global blnValidated
        blnValidated = bool(False)
        strInput = str(strInput)
        aInputList = []
        aSymListThree = list(map(chr, range(91, 97)))

        # Try and Except Validation of all required characters of string
        try:
            # Split the password input into separate characters inside a list array
            for lst in strInput.strip():
                aInputList.append(lst)

            # Check if the password has a the third correct special character
            for check in aSymListThree:
                if (check in aInputList):
                    blnValidated = bool(True)
                    break
                else:
                    blnValidated = bool(False)

        except ValueError:
            # Set value to zero
            blnValidated = bool(False)
            aSymListThree = list(map(chr, range(91, 97)))
            strInput = str(strInput)
            aInputList = []

        # Return Validation status
        return blnValidated

    def Validate_NumberChar(strInput):
        """ 
        Function Name: Validate_NumberChar
        Function Description: This function validates the user password symbol parameter
        """                     
        # Declare Local Variable
        global blnValidated
        blnValidated = bool(False)
        strInput = str(strInput)
        aInputList = []
        aNumList = list(map(chr, range(48, 58)))

        # Try and Except Validation of all required characters of string
        try:
            # Split the password input into separate characters inside a list array
            for lst in strInput.strip():
                aInputList.append(lst)

            # Validate the string password holds the correct parameters for character authentication
            # Check if the password has a the a number character
            for check in aNumList:
                if (check in aInputList):
                    blnValidated = bool(True)
                    break
                else:
                    blnValidated = bool(False)

        except ValueError:
            # Set value to zero
            blnValidated = bool(False)
            strInput = str(strInput)
            aInputList = []
            aNumList = list(map(chr, range(48, 58)))

        # Return Validation status
        return blnValidated

    def Hash_Password(strHashPassword):
        """ 
        Function Name: Hash_Password
        Function Description: Hash the password
        """        
        # Declare Local Variables
        strHashPassword = str(strHashPassword)

        # Convert the string into hash data and return the encrypted password
        strHashPassword = hashlib.sha512((strHashPassword.encode())).hexdigest()

        # Return Hash value of password
        return strHashPassword
        
    def Check_LoginPassword(logPswrd):
        """ 
        Function Name: Check_LoginPassword
        Function Description: This function checks if hashed password is in the database
        index
        """  
        global blnValidated
        blnValidated = bool(False)
        sqlQuery = """SELECT strPasswordInput FROM TPasswords"""   
        aQueryList = []

        # Get the database password values
        SQLQueries.Get_ValueList_Query(sqlQuery, aQueryList)
        
        try:
            if logPswrd in aQueryList:
                logPswrdIndex = aQueryList.index(logPswrd) + 1
                blnValidated = True
            else:
                blnValidated = False
                del logPswrd
                del LogPswrdIndex
        except ValueError as err:
            blnValidated = bool(False)
            messagebox.showwarning(title='ERROR', message='Execption Error because {}'.format(err))
            
        return (blnValidated, logPswrd, logPswrdIndex)
            
    def Validate_Symbol_Character(strInput):
        """ 
        Function Name: Validate_Symbol_Character
        Function Description: This function validates the user password having either of the three categories
        """  
        # Declare Local Variable
        global blnValidated
        blnValidated = bool(False)

        # Try and Except Validation of all required characters of string
        try:
            # First, check if the password has a special character (First Category)
            blnValidated = BaseFunctions.Validate_First_SymbolChar(strInput)

            # Check if the input is valid
            if (blnValidated is False):
                # Second, check if the password has a special character (Second Category)
                blnValidated = BaseFunctions.Validate_Second_SymbolChar(strInput)

                # Check if the input is valid
                if (blnValidated is False):
                    # Third, check if the password has a special character (Third Category)
                    blnValidated = BaseFunctions.Validate_Third_SymbolChar(strInput)

                    # Check if the input is valid
                    if (blnValidated is True):
                        # Jump out of loop
                        blnValidated = True

                    # Display the invalid message and set blnValidated to False
                    else:
                        blnValidated = False
                else:
                    blnValidated = True
            else:
                blnValidated = True

        except ValueError:
            # Set value to zero
            blnValidated = bool(False)

        # Return Validation Status
        return blnValidated

    def Validate_Login_Password(strInput):
        """ 
        Function Name: Validate_Login_Password
        Function Description: This function validates the user password has one capital letter, one number,
        and one character, password length, and if all is true, hash the password and return a tuple
        """          
        # Declare Local Variable
        global blnValidated
        blnValidated = bool(False)

        # Validate the string password holds the correct parameters for character authentication
        # Try and Except Validation of all required characters of string
        try:

            # Validate the password length
            blnValidated = BaseFunctions.Validate_Password_Length(strInput)
                                # Check if the input is valid
            if (blnValidated is True):
                # Check if the password contains a capital letter
                blnValidated = BaseFunctions.Validate_CapitalChar(strInput)

                # Check if the input is valid
                if (blnValidated is True):
                    # Check if the password contains any of the three categories of special characters
                    blnValidated = BaseFunctions.Validate_Symbol_Character(strInput)

                    # Check if the input is valid
                    if (blnValidated is True):
                        # Check if the password has a number character
                        blnValidated = BaseFunctions.Validate_NumberChar(strInput)

                        # Check if the input is valid
                        if (blnValidated is True):
                            # Hash the password
                            strInput = BaseFunctions.Hash_Password(strInput)

                            # Check if the password is correct 
                            pswrdReturnTuple = BaseFunctions.Check_LoginPassword(strInput)
                        else:
                            blnValidated = False
                    else:
                        blnValidated = False                            
                else:
                    blnValidated = False
            else:
                blnValidated = False

        except ValueError:
            # Set value to zero
            blnValidated = bool(False)

        # Return Validation Status
        return pswrdReturnTuple    
    

           


        