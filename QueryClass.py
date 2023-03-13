# ----------------------------------------------------------------------------------------------------
# Module Name: Query Class Module
# Module Description: This module contains all the SQL queries for any outer module request. 
# ----------------------------------------------------------------------------------------------------

# Import Python Libraries
import re
import hashlib
# from pyisemail import is_email
from datetime import datetime, timedelta, date
from dateutil.relativedelta import relativedelta
# import os
import subprocess
import sys
import pandas as pd
# from pandas import ExcelWriter
import pyodbc
from tkinter import *
from tkinter import messagebox, filedialog


#######################################################################################################
# Primary SQL Query Class 
#######################################################################################################

class SQLQueries():
    """
    Class Name: SQLQueries
    Class Description: This class uses the base functions to connect to the database, and make calls to 
    stored procedures found in the database. Perform read/write functions, views, stored procedures queries
    """
    
    def Get_Database_Connect():
        """ 
        Function Name: Get_Database_Connect
        Function Purpose: This function executes ever time the user is trying to connect to the database.
        For testing purposes, please enter your own server name, user name, password to connect to MSSQL
        """           
        try:
            # Create the db connection string
            server = ''
            database = 'FireExdbMAIN'
            username = ''
            password = ''
            db_engine = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
                    
        # Display error message and rollback the query
        except Exception as err:
            print("Exception occurred while fetching the records", err)
            
        # If all is good, return the connection object
        finally:
            return db_engine
        
    def Open_XL_File(): 
        """ 
        Function Name: Open_XL_File
        Function Purpose: This button executes when the user wants to open the parent dir and open XL files. Pops up
        the file dialog and displays contents within the parent dir.
        """    
        # Create the file list availabe to the user
        fList = [("Excel files","*.xlsx")]
        
        # Mask the file types available for input
        file = filedialog.askopenfilename(title="Select File",
                                          initialdir="RecordReport", 
                                          filetypes=fList) 
        # Create a new variable for file so pythond doesn't get confused
        fName = file

        # Open the file in read mode 
        with open(fName, 'r') as f:
            while True:
                try:
                    # Open and load the file from Unix
                    if sys.platform.startswith('darwin'):
                        subprocess.call(('open', fName))
                        f.close()
                        break
                    # Open and load the file from Win
                    elif sys.platform.startswith('win32'):
                        subprocess.call(('open', fName))
                        f.close()
                        break
                    # Open and load the file from Linux
                    elif sys.platform.startswith('linux'):
                        subprocess.call(('open', fName))
                        f.close()
                        break                    
                except EOFError:
                    f.close()
                    break

    def Save_XL_File(sqlQuery): 
        """ 
        Function Name: Save_XL_File
        Function Purpose: This button executes when the user wants to open the parent dir and write/save XL files. Pops up
        the file dialog and displays contents within the dir to name and save under the parent dir.
        """    
        # Get todays date
        dtmToday = datetime.date(datetime.now())
        dtmToday = datetime.strftime(dtmToday, '%m/%d/%Y')
        dtmToday = str(dtmToday)
            
        # Create the file list availabe to the user
        fList = [("Excel files","*.xlsx")]
        
        # Mask the file types available for input
        file = filedialog.asksaveasfilename(title = "Save File", 
                                            initialdir="RecordReport",
                                            initialfile='-'+dtmToday,
                                            filetypes = fList,
                                            defaultextension=(".xlsx"),
                                            confirmoverwrite=True) 
        # Create a new file variable name so that python doesn't get confused
        fNewFile = str(file)

        # Open the file in write mode 
        while True:
            try:
                # Open and load the file
                if sys.platform.startswith('darwin'):
                    # Create the excel file by passing in the sql query from the db for UNIX
                    SQLQueries.Create_XL_View(sqlQuery, fNewFile)
                    break
                    
                elif sys.platform.startswith('win32'):
                    # Create the excel file by passing in the sql query from the db for Win
                    SQLQueries.Create_XL_View(sqlQuery, fNewFile)
                    break
                
                elif sys.platform.startswith('linux'):
                    # Create the excel file by passing in the sql query from the db for Linux
                    SQLQueries.Create_XL_View(sqlQuery, fNewFile)
                    break
                            
            except EOFError:
                break
        
    # Button(root, text='Save', command=lambda:SQLQueries.Save_XL_File()).pack() 
    # Button(root, text='Open', command=lambda:SQLQueries.Open_XL_File()).pack()     


    def Create_XL_View(strSQLStringQuery, fPath):
        """ 
        Function Name: Create_XL_View
        Function Purpose: This function executes when the user decides to create an excel file with a view passed in
        from the database.
        """          
        try:
            # Call the Get_Database_Connect function and return the engine object
            conn = SQLQueries.Get_Database_Connect()

            # Execute a query to store the data into the dataframe object
            df = pd.read_sql(strSQLStringQuery, conn)

        # Display error message and rollback the query
        except Exception as err:
            print("Exception occurred while fetching the records", err)

        # If all is good, close the connections
        finally:
            # Close the connection
            conn.close()
            
            # Export the dataframe to the excel file
            df.to_excel(fPath, index=False)
        

    def Exe_StoredPro_Query(stSQLStringQuery):
        """ 
        Function Name: Exe_StoredPro_Query
        Function Purpose: This function is write only. Connect to database and execute the stored procedure 
        passed in with as many parameters needed.
        """            
        try:              
            # Call the Get_Database_Connect function and return the engine object
            conn = SQLQueries.Get_Database_Connect()

            # Create cursor object
            cur = conn.cursor()

            # Execute the stored pr
            cur.execute(stSQLStringQuery)

            # Commit the query
            cur.commit()            

        # Display error message and rollback the query
        except Exception as err:
            print("Exception occurred while fetching the records", err)
            cur.rollback()

        # If all is good, close the connections
        finally:
            # Close the cursor
            cur.close()

            # Close the connection
            conn.close()

        # Return
        return     

    def Exe_StoredProDates_Query(stSQLStringQuery, sqlQueryObjects):
        """ 
        Function Name: Exe_StoredProDates_Query
        Function Purpose: This function is write only. Connect to database and execute the stored procedure 
        passed in with as many parameters needed. This is only used with datetime objects
        """            
        try:              
            # Call the Get_Database_Connect function and return the engine object
            conn = SQLQueries.Get_Database_Connect()

            # Create cursor object
            cur = conn.cursor()

            # Execute the stored pr
            cur.execute(stSQLStringQuery, sqlQueryObjects)

            # Commit the query
            cur.commit()            

        # Display error message and rollback the query
        except Exception as err:
            print("Exception occurred while fetching the records", err)
            cur.rollback()

        # If all is good, close the connections
        finally:
            # Close the cursor
            cur.close()

            # Close the connection
            conn.close()

        # Return
        return        
    

    def Get_KeyValue_Query(stSQLStringQuery, aKeyValueArgs):
        """ 
        Function Name: Get_KeyValue_Query
        Function Purpose: This function is read only. Connect to database and Get all the keys and values from
        the many possible number of arguments and the string selection. Will not receive only one query object
        """            
        """Declare Local Variables"""
        aintKeyIDList = []
        astrValueList = []
        
        try:
            # Call the Get_Database_Connect function and return the engine object
            conn = SQLQueries.Get_Database_Connect()

            # Create cursor object
            cur = conn.cursor()

            # Execute the query and get the keyID and the value
            row = cur.execute(stSQLStringQuery)

            # Fetch the result
            row = cur.fetchall()
            
            # Get the ID as Key and value as string
            for i in row:
                aintKeyIDList.append(i[0])
                astrValueList.append(i[1])

            # Set the local arrays to the class object list passed in as aKeyValueArgs
            aKeyValueArgs[0] = aintKeyIDList
            aKeyValueArgs[1] = astrValueList

        # Display error message and rollback the query
        except Exception as err:
            print("Exception occurred while fetching the records", err)
            cur.rollback()

        # If all is good, close the connections
        finally:
            # Close the cursor
            cur.close()

            # Close the connection
            conn.close()

        # Return
        return aKeyValueArgs
    

    def Get_KeyList_Query(strSQLStringQuery, aKeyArgs):
        """ 
        Function Name: Get_KeyList_Query
        Function Purpose: This function is read only. Connect to database and Get only the keyID's with as 
        many ID's found in the databse table
        """          
        """Declare Local Variables"""
        aintKeyIDList = []
        
        try:
            # Call the Get_Database_Connect function and return the engine object
            conn = SQLQueries.Get_Database_Connect()

            # Create cursor object
            cur = conn.cursor()

            # Execute the query and get the keyID and the value
            row = cur.execute(strSQLStringQuery)

            # Fetch the result
            row = cur.fetchall()
            
            # Get the ID as Key and value as string
            for i in row:
                aintKeyIDList.append(i[0])
                
            # Set the local arrays to the class object list passed in as aKeyArgs
            aKeyArgs = aintKeyIDList

        # Display error message and rollback the query
        except Exception as err:
            print("Exception occurred while fetching the records", err)
            cur.rollback()

        # If all is good, close the connections
        finally:
            # Close the cursor
            cur.close()

            # Close the connection
            conn.close()

        # Return
        return aKeyArgs

    def Get_ValueList_Query(strSQLStringQuery, args):
        """ 
        Function Name: Get_ValueList_Query
        Function Purpose: This function is read only. Connect to database and Get only the keys with as 
        many values found in the databse table
        """           
        """Declare Local Variables"""
        aValueArgs = []
        
        try:
            # Call the Get_Database_Connect function and return the engine object
            conn = SQLQueries.Get_Database_Connect()

            # Create cursor object
            cur = conn.cursor()

            # Execute the query and get the keyID and the value
            row = cur.execute(strSQLStringQuery)
            
            # Fetch the result
            row = cur.fetchall()
            
            for i in row:
                aValueArgs.append(i[0])
                
            args = aValueArgs
            
        # Display error message and rollback the query
        except Exception as err:
            print("Exception occurred while fetching the records", err)
            cur.rollback()

        # If all is good, close the connections
        finally:
            # Close the cursor
            cur.close()

            # Close the connection
            conn.close()

        # Return
        return args

    def Get_SingleValue_Query(strSQLStringQuery, args):
        """ 
        Function Name: Get_SingleValue_Query
        Function Purpose: This function is read only. Connect to database and Get only a sinlge value
        """           
        try:
            # Call the Get_Database_Connect function and return the engine object
            conn = SQLQueries.Get_Database_Connect()

            # Create cursor object
            cur = conn.cursor()

            # Execute the query and get the keyID and the value
            row = cur.execute(strSQLStringQuery)
            
            # Fetch the result
            row = cur.fetchone()

            # Assign the single value
            args = row
            
        # Display error message and rollback the query
        except Exception as err:
            print("Exception occurred while fetching the records", err)
            cur.rollback()

        # If all is good, close the connections
        finally:
            # Close the cursor
            cur.close()

            # Close the connection
            conn.close()

        # Return
        return args
    
    def Get_AllValues_Query(strSQLStringQuery, args):
        """ 
        Function Name: Get_AllValues_Query
        Function Purpose: This function is read only. Connect to database and Get all of the values
        """           
        try:
            # Call the Get_Database_Connect function and return the engine object
            conn = SQLQueries.Get_Database_Connect()

            # Create cursor object
            cur = conn.cursor()

            # Execute the query and get the values
            row = cur.execute(strSQLStringQuery)
            
            # Fetch the result
            row = cur.fetchall()

            # Assign all the
            args = row
            
        # Display error message and rollback the query
        except Exception as err:
            print("Exception occurred while fetching the records", err)
            cur.rollback()

        # If all is good, close the connections
        finally:
            # Close the cursor
            cur.close()

            # Close the connection
            conn.close()

        # Return
        return args
        
    def Check_Login_Name(logName):
        """ 
        Function Name: Validate_Login_Password
        Function Description: This function validates the user user login name and returns a tuple of the 
        blnValidated status, login name from the user, and the loging ID number
        """   
        # Declare Local Variables
        global blnValidated
        blnValidated = bool(False)
        sqlQuery = """SELECT strLoginName FROM TLogins"""
        aQueryList = []
        logID = int(0)

        # Get the user login name
        try:
            # Get the database login keys and values
            aQueryList = SQLQueries.Get_ValueList_Query(sqlQuery, aQueryList)

            # Check if the login name entered by the user is in the database
            if (logName in aQueryList):
                # Set the LoginID and the LoginName to the values held at the element index
                logID = aQueryList.index(logName) + 1
                blnValidated = True
            else:
                blnValidated = False 

        except ValueError as err:
            blnValidated = bool(False)
            messagebox.showwarning(title='ERROR', message='Execption Error because {}'.format(err))

        # Return the Validated status
        return [blnValidated, logName, logID]
    
    def Check_LoginPassword(logPswrd):
        """ 
        Function Name: Check_LoginPassword
        Function Description: This function checks if hashed password is in the database
        index
        """  
        global blnValidated
        blnValidated = bool(False)
        sqlQuery = """SELECT strPassword FROM TLogins"""   
        aQueryList = []
        logPswrdIndex = int(0)

        # Get the database password values
        aQueryList = SQLQueries.Get_ValueList_Query(sqlQuery, aQueryList)
        
        try:
            if logPswrd in aQueryList:
                logPswrdIndex = aQueryList.index(logPswrd) + 1
                blnValidated = True
            else:
                blnValidated = False

        except ValueError as err:
            blnValidated = bool(False)
            messagebox.showwarning(title='ERROR', message='Execption Error because {}'.format(err))
            
        return [blnValidated, logPswrd, logPswrdIndex]

    def Load_InspectionStatus_Data():
        """ 
        Function Name: Load_InspectionStatus_Data
        Function Description: This function gets the all of the inspection status data from the table TInspectionStatus
        and returns the values
        """  
        global blnValidated
        blnValidated = bool(False)
        sqlQuery = """SELECT intInspectionStatusID, strInspectionStatusDesc FROM TInspectionStatus"""   
        aQueryList = [[],[]]
        
        try:
            # Get the objects from the database
            aQueryList = SQLQueries.Get_KeyValue_Query(sqlQuery, aQueryList)
            
        except ValueError as err:
            blnValidated = bool(False)
            messagebox.showwarning(title='ERROR', message='Execption Error because {}'.format(err))
            
        return aQueryList
            
    def Load_FacilityNames_Query():
        """ 
        Function Name: Load_FacilityQuery
        Function Description: This function gets the all of the facility names from the db
        """  
        global blnValidated
        blnValidated = bool(False)
        sqlQuery = """SELECT strFacilityName FROM TFacilities"""   
        aQueryList = []
        
        try:
            # Get the objects from the database
            aQueryList = SQLQueries.Get_ValueList_Query(sqlQuery, aQueryList)
            
        except ValueError as err:
            blnValidated = bool(False)
            messagebox.showwarning(title='ERROR', message='Execption Error because {}'.format(err))
            
        return aQueryList
    
    def Load_LocationData_Query():
        """ 
        Function Name: Load_LocationData_Query
        Function Description: This function gets the all of the location names from the db
        """  
        global blnValidated
        blnValidated = bool(False)
        sqlQuery = """SELECT intLocationID, strLocationDesc FROM TLocations"""   
        aQueryList = [[],[]]
        
        try:
           # Get the objects from the database
            aQueryList = SQLQueries.Get_ValueList_Query(sqlQuery, aQueryList)
            
        except ValueError as err:
            blnValidated = bool(False)
            messagebox.showwarning(title='ERROR', message='Execption Error because {}'.format(err))
            
        return aQueryList
    
    def Load_FacilityData_Query():
        """ 
        Function Name: Load_FacilityData_Query
        Function Description: This function gets the all of the facility names from the db
        """  
        global blnValidated
        blnValidated = bool(False)
        sqlQuery = """SELECT intFacilityID, strFacilityName FROM TFacilities"""   
        aQueryList = [[],[]]
        
        try:
            # Get the objects from the database
            aQueryList = SQLQueries.Get_ValueList_Query(sqlQuery, aQueryList)
            
        except ValueError as err:
            blnValidated = bool(False)
            messagebox.showwarning(title='ERROR', message='Execption Error because {}'.format(err))
            
        return aQueryList

        
    def Load_HoseData_Query():
        """ 
        Function Name: Load_HoseData_Query
        Function Description: This function gets the all of the hose length from the db
        """  
        global blnValidated
        blnValidated = bool(False)
        sqlQuery = """SELECT intHoseID, strHoseLength FROM THoses"""   
        aQueryList = [[],[]]
        
        try:
            # Get the objects from the database
            aQueryList = SQLQueries.Get_KeyValue_Query(sqlQuery, aQueryList)
            
        except ValueError as err:
            blnValidated = bool(False)
            messagebox.showwarning(title='ERROR', message='Execption Error because {}'.format(err))
            
        return aQueryList        
    
    def Load_HandleData_Query():
        """ 
        Function Name: Load_HandleData_Query
        Function Description: This function gets the all of the handle types from the db
        """  
        global blnValidated
        blnValidated = bool(False)
        sqlQuery = """SELECT intHandleID, strHandleType FROM THandles"""   
        aQueryList = [[],[]]
        
        try:
            # Get the objects from the database
            aQueryList = SQLQueries.Get_KeyValue_Query(sqlQuery, aQueryList)
            
        except ValueError as err:
            blnValidated = bool(False)
            messagebox.showwarning(title='ERROR', message='Execption Error because {}'.format(err))
            
        return aQueryList  

    def Load_PressGuageID_Query():
        """ 
        Function Name: Load_PressGuageID_Query
        Function Description: This function gets the all of the pressure guage ID's from the db
        """  
        global blnValidated
        blnValidated = bool(False)
        sqlQuery = """SELECT intPressGuageID FROM TPressureGuages"""   
        aQueryList = []
        
        try:
            # Get the objects from the database
            aQueryList = SQLQueries.Get_KeyList_Query(sqlQuery, aQueryList)
            
        except ValueError as err:
            blnValidated = bool(False)
            messagebox.showwarning(title='ERROR', message='Execption Error because {}'.format(err))
            
        return aQueryList   
            
    def Load_PressGuageType_Query():
        """ 
        Function Name: Load_PressGuageType_Query
        Function Description: This function gets the all of the pressure guage types from the db
        """  
        global blnValidated
        blnValidated = bool(False)
        sqlQuery = """SELECT strPressureType FROM TPressGuageTypes"""   
        aQueryList = []
        
        try:
            # Get the objects from the database
            aQueryList = SQLQueries.Get_ValueList_Query(sqlQuery, aQueryList)
            
        except ValueError as err:
            blnValidated = bool(False)
            messagebox.showwarning(title='ERROR', message='Execption Error because {}'.format(err))
            
        return aQueryList  
    
    def Load_PressGuageRange_Query():
        """ 
        Function Name: Load_PressGuageRange_Query
        Function Description: This function gets the all of the pressure guage ranges from the db
        """  
        global blnValidated
        blnValidated = bool(False)
        sqlQuery = """SELECT strPressureRange FROM TPressGuageRanges"""   
        aQueryList = []
        
        try:
            # Get the objects from the database
            aQueryList = SQLQueries.Get_ValueList_Query(sqlQuery, aQueryList)
            
        except ValueError as err:
            blnValidated = bool(False)
            messagebox.showwarning(title='ERROR', message='Execption Error because {}'.format(err))
            
        return aQueryList     

    def Load_CaseID_Query():
        """ 
        Function Name: Load_CaseID_Query
        Function Description: This function gets the all of the Case ID's from the db
        """  
        global blnValidated
        blnValidated = bool(False)
        sqlQuery = """SELECT intCaseID FROM TCases"""   
        aQueryList = []
        
        try:
            # Get the objects from the database
            aQueryList = SQLQueries.Get_KeyList_Query(sqlQuery, aQueryList)
            
        except ValueError as err:
            blnValidated = bool(False)
            messagebox.showwarning(title='ERROR', message='Execption Error because {}'.format(err))
            
        return aQueryList   
    
    def Load_CaseWeight_Query():
        """ 
        Function Name: Load_CaseWeight_Query
        Function Description: This function gets the all of the case weight from the db
        """  
        global blnValidated
        blnValidated = bool(False)
        sqlQuery = """SELECT strCaseWeight FROM TCaseWeights"""   
        aQueryList = []
        
        try:
            # Get the objects from the database
            aQueryList = SQLQueries.Get_ValueList_Query(sqlQuery, aQueryList)
            
        except ValueError as err:
            blnValidated = bool(False)
            messagebox.showwarning(title='ERROR', message='Execption Error because {}'.format(err))
            
        return aQueryList   
    
    def Load_CaseAgent_Query():
        """ 
        Function Name: Load_CaseAgent_Query
        Function Description: This function gets the all of the case agents from the db
        """  
        global blnValidated
        blnValidated = bool(False)
        sqlQuery = """SELECT strCaseAgents FROM TCaseAgents"""   
        aQueryList = []
        
        try:
            # Get the objects from the database
            aQueryList = SQLQueries.Get_ValueList_Query(sqlQuery, aQueryList)
            
        except ValueError as err:
            blnValidated = bool(False)
            messagebox.showwarning(title='ERROR', message='Execption Error because {}'.format(err))
            
        return aQueryList   
    
    def Load_HouseData_Query():
        """ 
        Function Name: Load_HouseData_Query
        Function Description: This function gets the all of the housing data from the db
        """  
        global blnValidated
        blnValidated = bool(False)
        sqlQuery = """SELECT intHousingID, strHousingDesc FROM THousings"""   
        aQueryList = [[],[]]
        
        try:
            # Get the objects from the database
            aQueryList = SQLQueries.Get_KeyValue_Query(sqlQuery, aQueryList)
            
        except ValueError as err:
            blnValidated = bool(False)
            messagebox.showwarning(title='ERROR', message='Execption Error because {}'.format(err))
            
        return aQueryList   
    
    def Load_StateData_Query():
        """ 
        Function Name: Load_StateData_Query
        Function Description: This function gets the all of the state data from the db
        """  
        global blnValidated
        blnValidated = bool(False)
        sqlQuery = """SELECT intStateID, strStateName FROM TStates"""   
        aQueryList = [[],[]]
        
        try:
            # Get the objects from the database
            aQueryList = SQLQueries.Get_KeyValue_Query(sqlQuery, aQueryList)
            
        except ValueError as err:
            blnValidated = bool(False)
            messagebox.showwarning(title='ERROR', message='Execption Error because {}'.format(err))
            
        return aQueryList   

    def Load_AllData_Query(sqlQuery):
        """ 
        Function Name: Load_AllData_Query
        Function Description: This function gets the all of the data from the db. Pass in the query string and 
        return the list object. 
        """  
        global blnValidated
        blnValidated = bool(False)  
        aQueryList = []
        
        try:
            # Get the objects from the database
            aQueryList = SQLQueries.Get_AllValues_Query(sqlQuery, aQueryList)
            
        except ValueError as err:
            blnValidated = bool(False)
            messagebox.showwarning(title='ERROR', message='Execption Error because {}'.format(err))
            
        return aQueryList   
    
    def Load_SerialNum_Query():
        """ 
        Function Name: Load_SerialNum_Query
        Function Description: This function gets the all of the serial numbers from the db
        """  
        global blnValidated
        blnValidated = bool(False)
        sqlQuery = """SELECT strSerialNum FROM TFireEx"""   
        aQueryList = []
        
        try:
            # Get the objects from the database
            aQueryList = SQLQueries.Get_ValueList_Query(sqlQuery, aQueryList)
            
        except ValueError as err:
            blnValidated = bool(False)
            messagebox.showwarning(title='ERROR', message='Execption Error because {}'.format(err))
            
        return aQueryList
    
            
    def Load_CaseData_Query(WeightID, AgentID):
        """ 
        Function Name: Load_CaseData_Query
        Function Description: This function gets the case ID based of the database table Case results. Pass in WeightID
        and AgentID
        """   
        # Declare Local Variables
        global blnValidated
        blnValidated = bool(False)
        sqlQuery = """SELECT intCaseID FROM TCases 
                      WHERE %d IN (SELECT intCaseWeightID FROM TCases)
                      AND %d IN (SELECT intCaseAgentID FROM TCases)""" % (WeightID, AgentID)
        CaseID = int(0)

        # Get the user login name
        try:
            # Get the database login keys and values
            CaseID = SQLQueries.Get_SingleValue_Query(sqlQuery, CaseID)
            CaseID = CaseID[0]

        except ValueError as err:
            blnValidated = bool(False)
            messagebox.showwarning(title='ERROR', message='Execption Error because {}'.format(err))

        # Return the result
        return CaseID
                  
    def Load_PressGuageData_Query(PressGuageTypeID, PressGuageRangeID):
        """ 
        Function Name: Get_PressGuageID
        Function Description: This function gets the case ID based of the database table Press Guage results. 
        Pass in TypeID and RangeID
        """   
        # Declare Local Variables
        global blnValidated
        blnValidated = bool(False)
        sqlQuery = """SELECT intPressGuageID FROM TPressureGuages 
                      WHERE %d IN (SELECT intPressGuageTypeID FROM TPressureGuages)
                      AND %d IN (SELECT intPressGuageRangeID FROM TPressureGuages)""" % (PressGuageTypeID, PressGuageRangeID)
        PressID = int(0)

        # Get the user login name
        try:
            # Get the database login keys and values
            PressID = SQLQueries.Get_SingleValue_Query(sqlQuery, PressID)
            PressID = PressID[0]
        except ValueError as err:
            blnValidated = bool(False)
            messagebox.showwarning(title='ERROR', message='Execption Error because {}'.format(err))

        # Return the result
        return PressID
    
                                    
#######################################################################################################
# Base Function Class 
#######################################################################################################
     
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
        chrPatternString = str("-, +, *, #, _")
        strInput = str(strInput)

        # Validation function
        try:
            # Validate the String to determine if the string is not empty, either contains numbers, letters,
            # both numbers and letters, or numbers, letters, and a symbol
            if (strInput.isalpha()) or (strInput.isdigit()) or (strInput.isalnum()):
                blnValidated = True
            else:
                # Use the Regex function to find the given pattern. Return blnValidated as true if any of these
                # characters are found in the serial number
                Result = re.findall(chrPattern, strInput)
                
                # Neither of the symbols were found and the input is not valid
                if (Result == ""):
                    blnValidated = False
                    # Warn the user the date does not exist
                    messagebox.showwarning(title='ERROR', message='Invalid input. Serial number can only contain characters: %s.')%(chrPatternString)
                else:
                    blnValidated = True
                    
        except ValueError:
            # Set value to empty string
            strInput = str("")
            blnValidated = False
            chrPattern = r'[-+*#_]'
            messagebox.showwarning(title='ERROR', message='Invalid input. Please try again.')

        # Return String Input
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
                # Warn the user the date was out of range
                messagebox.showwarning(title='ERROR', message='Invalid input. Date was out of range.')
                blnValidated = False
        except ValueError:
            # Warn the user the date does not exist
            messagebox.showwarning(title='ERROR', message='Invalid input. Date does not exist.')

        # Return blnValidated status
        return blnValidated

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
        sqlQuery = """SELECT strPassword FROM TLogins"""   
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
        pswrdReturnList = []

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
                            pswrdReturnList = SQLQueries.Check_LoginPassword(strInput)
        
                            # Return list objects
                            return pswrdReturnList                             
                        else:
                            blnValidated = False
                            pswrdReturnList.append(blnValidated)
                            return pswrdReturnList
                    else:
                        blnValidated = False    
                        pswrdReturnList.append(blnValidated)
                        return pswrdReturnList                       
                else:
                    blnValidated = False
                    pswrdReturnList.append(blnValidated)
                    return pswrdReturnList
            else:
                blnValidated = False
                pswrdReturnList.append(blnValidated)
                return pswrdReturnList

        except ValueError:
            # Set value to zero
            blnValidated = bool(False)

    def Update_Inspection_Date():
        """ 
        Function Name: Update_Inspection_Date
        Function Purpose: This function updates the inspection to the current date, and the next inspection Date 
        """       
        # Declare Local Variables
        dtmToday = datetime.now()
        
        # Set the Inspection date to the current date 
        lastDate = dtmToday
        
        # Add a thirty days to the next inspection Date 
        nextDate = lastDate + timedelta(days=30)

        return [lastDate, nextDate]
    
    def Update_Service_InspectionDate(dtmUserInput):
        """ 
        Function Name: Update_Service_InspectionDate
        Function Purpose: This function updates the service inspection to the user input, and adds 1 year
        to the service date to equal the re-service date
        """               
        # Declare Local Variables
        dtmToday = datetime.now()
        
        # Converting the string to datetime value
        dtmDateTimeResult = datetime.strptime(dtmUserInput, '%m/%d/%Y')

        # Change the base datetime hour, minute, and second to todays time of entry
        dtmServiceDate = dtmDateTimeResult.replace(hour=dtmToday.hour, 
                                                   minute=dtmToday.minute, 
                                                   second=dtmToday.second)

        # Add a year to the Service Date so Reservice Date is always one year older                            
        dtmReserviceDate = dtmServiceDate + relativedelta(years=1)   
        
        return [dtmServiceDate, dtmReserviceDate]
    
    