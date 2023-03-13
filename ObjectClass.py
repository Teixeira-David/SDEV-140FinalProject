# ----------------------------------------------------------------------------------------------------
# Module Name: Object Class Module
# Module Description: This module contains all the classes for each Inspector, Login Cred, Facility,
# and Fire Extinguisher Component. 
# ----------------------------------------------------------------------------------------------------

# Import Python Libraries
from datetime import datetime, date
from tkinter import *
from pyisemail import is_email

# Import from Project modules
from QueryClass import SQLQueries, BaseFunctions

#######################################################################################################
# Primary Class Objects
#######################################################################################################

class Inspector():
    """
    Class Name: Inspector
    Class Description: This class gets and sets inspector information (fName, lName, Email)
    """
    # Create class variable shared amongst all Inspector methods
    aintInspectorID = []   
    
    # Common base class for all Inspectors information. Instantiates the base class
    def __init__(self, intInspectorID, strFirstName, strLastName, strEmail):
        self.intInspectorID = intInspectorID
        self.strFirstname = strFirstName
        self.strLastname = strLastName
        self.strEmail = strEmail 

    # Create a string with first and last names appended together
    def __str__(self):
        # Assign the first and last names to appended string
        return str(self.strLastName + '.' + self.strFirstName)
                    
    # Property decorator object get function to access private Inspector ID
    @property
    def intInspectorID(self):
        return self._intInspectorID

    # Property decorator object get function to access private First Name
    @property
    def strFirstName(self):
        return self._strFirstName

    # Property decorator object get function to access private Last Name
    @property
    def strLastName(self):
        return self._strLastName         

    # Property decorator object get function to access private Email
    @property
    def strEmail(self):
        return self._strEmail

    # setter method 
    @intInspectorID.setter 
    def intInspectorID(self, intInspectorID): 
        # Return true if specified object is of int type
        if not isinstance(intInspectorID, int): 
            raise TypeError('ID must be an integer') 
        # Check if the value is less than zero, otherwise return true and set the ID to value
        if intInspectorID < 0:  
            raise ValueError('ID cannot be empty') 

        self._intInspectorID = intInspectorID
    
    # setter method 
    @strFirstName.setter 
    def strFirstName(self, strFirstName): 
        # Return true if specified object is of str type
        if not isinstance(strFirstName, str): 
            raise TypeError('First Name must be a string') 
        # Check if the value is empty, otherwise check if the value is alpha
        if strFirstName.isspace(): 
            raise ValueError('First Name cannot be empty') 
        # Set the attribute to the value if true
        elif strFirstName.isalpha():
            self._strFirstName = strFirstName.capitalize()

    # setter method 
    @strLastName.setter 
    def strLastName(self, strLastName): 
        # Return true if specified object is of str type
        if not isinstance(strLastName, str):
            raise TypeError('Last Name must be a string') 
        # Check if the value is empty, otherwise check if the value is alpha
        if strLastName.isspace(): 
            raise ValueError('Last Name cannot be empty') 
        # Set the attribute to the value if true
        elif strLastName.isalpha():
            self._strLastName = strLastName.capitalize()

    # setter method 
    @strEmail.setter 
    def strEmail(self, strEmail): 
        blnFLAG = bool(False)
        blnFLAG = is_email(strEmail,  allow_gtld=True)
        # Return true if specified object is of str type
        if not isinstance(strEmail, str): 
            raise TypeError('Eamil must be an string') 
        # Check if the value is empty, otherwise check if the value is alpha numeric
        if strEmail.isspace(): 
            raise ValueError('Eamil cannot be empty') 
        # Set the attribute to the value if true
        if strEmail.isalnum() and blnFLAG is True:
            self._strEmail = strEmail                   
        
    def Append_InspectorIDList(self, intObject):
        """ 
        Function Name: Append_InspectorIDList
        Function Description: This function appends objects to the Inspector ID list
        """    
        self.aintInspectorID.append(intObject)

    def Remove_InspectorIDList(self, intObject):
        """ 
        Function Name: Remove_InspectorIDList
        Function Description: This function removes objects in the Inspector ID list
        """    
        self.aintInspectorID.remove(intObject)

    def Get_InspectorIDList_Obj(self):
        """ 
        Function Name: Get_InspectorIDList_Obj
        Function Description: This function gets all the objects in the Inspector ID list
        """    
        return self.aintInspectorID
          
                        
class LoginName():
    """
    Class Name: LoginName
    Class Description: This class gets and sets the user login name. 
    """
    # Create class variable shared amongst all LoginName methods
    aintLoginID = []   
    astrLoginName = []
    astrLoginPassword = []
        
    # Common base class for all user login names. Instantiates the base class
    def __init__(self, intLoginID, strLoginName, strLoginPassword):
        self.intLoginID = intLoginID
        self.strLoginName = strLoginName
        self.strLoginPassword = strLoginPassword

    # Append the First and Last names to assign a login name
    def __str__(self):
        self.strLoginName = str(self.strFirstName + "." + self.strLastName)
        return self.strLoginName
            
    # Property decorator object get function to access private User Login ID
    @property
    def intLoginID(self):
        return self._intLoginID

    # Property decorator object get function to access private User Login Name
    @property
    def strLoginName(self):
        return self._strLoginName

    # Property decorator object get function to access private strPassword
    @property
    def strLoginPassword(self):
        return self._strLoginPassword   
            
    # setter method 
    @intLoginID.setter 
    def intLoginID(self, intLoginID): 
        # Return true if specified object is of int type
        if not isinstance(intLoginID, int): 
            raise TypeError('ID must be an integer') 
        # Check if the value is less than zero, otherwise return true and set the ID to value
        if intLoginID < 0: 
            raise ValueError('ID cannot be empty') 
        self._intLoginID = intLoginID
                
    # setter method 
    @strLoginName.setter 
    def strLoginName(self, strLoginName): 
        # Return true if specified object is of str type
        if not isinstance(strLoginName, str): 
            raise TypeError('Login Name must be a string') 
        # Check if the value is empty, otherwise check if the value is alpha
        if strLoginName.isspace(): 
            raise ValueError('Login Name cannot be empty') 

        self._strLoginName = strLoginName

    # setter method 
    @strLoginPassword.setter 
    def strLoginPassword(self, strLoginPassword): 
        # Return true if specified object is of str type
        if not isinstance(strLoginPassword, str): 
            raise TypeError('Password must be a string') 
        # Check if the value is empty, otherwise check if the value is alpha numeric
        if strLoginPassword.isspace(): 
            raise ValueError('Password cannot be empty') 
        
        self._strLoginPassword = strLoginPassword
            
    def Append_LoginIDList(self, intObject):
        """ 
        Function Name: Append_LoginIDList
        Function Description: This function appends objects to the Login ID list
        """
        self.aintLoginID.append(intObject)

    def Remove_LoginIDList(self, intObject):
        """ 
        Function Name: Remove_LoginIDList
        Function Description: This function removes objects in the Login ID list
        """    
        self.aintLoginID.remove(intObject)

    def Get_LoginIDList_Obj(self):
        """ 
        Function Name: Get_LoginIDList_Obj
        Function Description: This function gets all the objects in the Login ID list
        """    
        return self._aintLoginID
    
    def Append_LoginNameList(self, strObject):
        """ 
        Function Name: Append_LoginNameList
        Function Description: This function appends objects to the Login name list
        """    
        self.astrLoginName.append(strObject)

    def Remove_LoginNameList(self, strObject):
        """ 
        Function Name: Remove_LoginNameList
        Function Description: This function removes objects in the Login name list
        """    
        self.astrLoginName.remove(strObject)

    def Get_LoginNameList_Obj(self):
        """ 
        Function Name: Get_LoginNameList_Obj
        Function Description: This function gets all the objects in the Login name list
        """    
        return self.astrLoginName
    
    def Append_LoginPswrdList(self, strObject):
        """ 
        Function Name: Append_LoginPswrdList
        Function Description: This function appends objects to the Login Password list
        """    
        self.astrLoginPassword.append(strObject)

    def Remove_LoginPswrdList(self, strObject):
        """ 
        Function Name: Remove_LoginPswrdList
        Function Description: This function removes objects in the Login Password list
        """    
        self.astrLoginPassword.remove(strObject)

    def Get_LoginPswrdList_Obj(self):
        """ 
        Function Name: Get_LoginPswrdList_Obj
        Function Description: This function gets all the objects in the Login Password list
        """    
        return self._astrLoginPassword    
        
class UserLogins(LoginName):
    """
    Class Name: UserLogin
    Class Description: This class takes the InpsectorID, and LoginID from classes LoginName.
    This holds the UserLoginID and the strPassword input fromt the user. 
    """
    # Create class variable shared amongst all UserLogins methods
    aintUserLoginID = []   
        
    # Inheritance for all user logins and passwords. Instantiates the base class
    def __init__(self, intUserLoginID, intInspectorID, intLoginID):
        # Inherits the child class with all the necessary objects
        super().__init__(intInspectorID, intLoginID)
        self.intUserLoginID = intUserLoginID

    # Property decorator object get function to access private intUserLoginID
    @property
    def intUserLoginID(self):
        return self._intUserLoginID
    
    # setter method 
    @intUserLoginID.setter 
    def intUserLoginID(self, intUserLoginID): 
        # Return true if specified object is of int type
        if not isinstance(intUserLoginID, int): 
            raise TypeError('ID must be an integer') 
        # Check if the value is less than zero, otherwise return true and set the ID to value
        if intUserLoginID < 0: 
            raise ValueError('ID cannot be negative') 

        self._intUserLoginID = intUserLoginID

    def Append_UserLoginIDList(self, intObject):
        """ 
        Function Name: Append_LoginIDList
        Function Description: This function appends objects to the User Login ID list
        """    
        self.aintUserLoginID.append(intObject)

    def Remove_UserLoginIDList(self, intObject):
        """ 
        Function Name: Remove_LoginIDList
        Function Description: This function removes objects in the User Login ID list
        """    
        self.aintUserLoginID.remove(intObject)

    def Get_UserLoginIDList_Obj(self):
        """ 
        Function Name: Get_LoginIDList_Obj
        Function Description: This function gets all the objects in the User Login ID list
        """    
        return self.aintUserLoginID
                
        
class InspectionStatus():
    """
    Class Name: InspectionStatus
    Class Description: This class gets and sets all of the Inspection Status attributes. 
    """
    # Create class variable shared amongst all InspectionStatus methods
    aintInspectionStatusID = []
    astrInspectionStatusDesc = []
    
    # Instantiate the following attributes
    def __init__(self, intInspectionStatusID, strInspectionStatusDesc):
        self.intInspectionStatusID = intInspectionStatusID
        self.strInspectionStatusDesc = strInspectionStatusDesc

    # Append the First and Last names to assign a login name
    def __str__(self):
        return self.strInspectionStatusDesc
    
    # Property decorator object get function to access private intInspectionStatusID
    @property
    def intInspectionStatusID(self):
        return self._intInspectionStatusID

    # Property decorator object get function to access private strInspectionStatusDesc
    @property
    def strInspectionStatusDesc(self):
        return self._strInspectionStatusDesc
        
    # setter method 
    @intInspectionStatusID.setter 
    def intInspectionStatusID(self, intInspectionStatusID): 
        # Return true if specified object is of int type
        if not isinstance(intInspectionStatusID, int): 
            raise TypeError('ID must be an integer') 
        # Check if the value is less than zero, otherwise return true and set the ID to value
        if intInspectionStatusID < 0: 
            raise ValueError('ID cannot be negative') 

        self._intInspectionStatusID = intInspectionStatusID        

    # setter method 
    @strInspectionStatusDesc.setter 
    def strInspectionStatusDesc(self, strInspectionStatusDesc): 
        # Return true if specified object is of str type
        if not isinstance(strInspectionStatusDesc, str): 
            raise TypeError('Status must be a string') 
        # Check if the value is empty, otherwise check if the value is alpha
        if strInspectionStatusDesc.isspace(): 
            raise ValueError('Status cannot be empty') 
        # Set the attribute to the value if true
        elif strInspectionStatusDesc.isalpha():
            self._strInspectionStatusDesc = strInspectionStatusDesc

    def Append_StatusIDList(self, intObject):
        """ 
        Function Name: Append_StatusIDList
        Function Description: This function appends objects to the Inpsection Status ID list
        """    
        self.aintInspectionStatusID.append(intObject)

    def Remove_StatusIDList(self, intObject):
        """ 
        Function Name: Remove_StatusIDList
        Function Description: This function removes objects in the Inpsection Status ID list
        """    
        self.aintInspectionStatusID.remove(intObject)

    def Get_StatusIDList_Obj(self):
        """ 
        Function Name: Get_StatusIDList_Obj
        Function Description: This function gets all the objects in the Inpsection Status ID list
        """    
        return self.aintInspectionStatusID
    
    def Append_StatusDescList(self, strObject):
        """ 
        Function Name: Append_StatusDescList
        Function Description: This function appends objects to the Inpsection Status list
        """    
        self.astrInspectionStatusDesc.append(strObject)

    def Remove_StatusDescList(self, strObject):
        """ 
        Function Name: Remove_StatusDescList
        Function Description: This function removes objects in the Inpsection Status list
        """    
        self.astrInspectionStatusDesc.remove(strObject)

    def Get_StatusDescList_Obj(self):
        """ 
        Function Name: Get_StatusDescList_Obj
        Function Description: This function gets all the objects in the Inpsection Status list
        """    
        return self.astrInspectionStatusDesc   
    
    def Get_InspectionStatus_Data(self):
        """ 
        Function Name: Load_InspectionStatus_Data
        Function Description: This function gets all the objects in the Inpsection Status list
        """    
       # Create the sql query string
        sqlQuery = """SELECT * FROM TInspectionStatus"""
        
        # Get the query results
        QueryResultList = SQLQueries.Load_AllData_Query(sqlQuery)
    
        # Append the housing Data List
        for i in range(len(QueryResultList)):
            InspectionStatus.Append_StatusIDList(self, QueryResultList[i][0])
            InspectionStatus.Append_StatusDescList(self, QueryResultList[i][1])

    def Delete_InspectionStatus_Data(self):
        """ 
        Function Name: Delete_InspectionStatus_Data
        Function Description: This function removes all the objects in the Inpsection Status list
        """    
        del InspectionStatus.aintInspectionStatusID
        del InspectionStatus.astrInspectionStatusDesc
                    

class Hose():
    """
    Class Name: Hose
    Class Description: This class gets and sets all of the Hose attributes. 
    """
    # Create class variable shared amongst all Hose methods
    aintHoseID = []
    astrHoseLength = []
        
    # Instantiate the following attributes
    def __init__(self, intHoseID, strHoseLength):
        self.intHoseID = intHoseID
        self.strHoseLength = strHoseLength

    # Property decorator object get function to access private intHoseID
    @property
    def intHoseID(self):
        return self._intHoseID

    # Property decorator object get function to access private strHoseLength
    @property
    def strHoseLength(self):
        return self._strHoseLength
        
    # setter method 
    @intHoseID.setter 
    def intHoseID(self, intHoseID): 
        # Return true if specified object is of int type
        if not isinstance(intHoseID, int): 
            raise TypeError('ID must be an integer') 
        # Check if the value is less than zero, otherwise return true and set the ID to value
        if intHoseID < 0: 
            raise ValueError('ID cannot be negative') 

        self._intHoseID = intHoseID 
        
    # setter method 
    @strHoseLength.setter 
    def strHoseLength(self, strHoseLength): 
        # Return true if specified object is of str type
        if not isinstance(strHoseLength, str): 
            raise TypeError('Hose Length must be a string') 
        # Check if the value is empty, otherwise check if the value is alpha numeric
        if strHoseLength.isspace(): 
            raise ValueError('Hose Length cannot be empty') 
        # Set the attribute to the value if true
        elif strHoseLength.isalnum():
            self._strHoseLength = strHoseLength

    def Append_HoseIDList(self, intObject):
        """ 
        Function Name: Append_HoseIDList
        Function Description: This function appends objects to the Hose ID list
        """    
        self.aintHoseID.append(intObject)

    def Remove_HoseIDList(self, intObject):
        """ 
        Function Name: Remove_HoseIDList
        Function Description: This function removes objects in the Hose ID list
        """    
        self.aintHoseID.remove(intObject)

    def Get_HoseIDList_Obj(self):
        """ 
        Function Name: Get_HoseIDList_Obj
        Function Description: This function gets all the objects in the Hose ID list
        """    
        return self.aintHoseID
    
    def Append_HoseLengthList(self, strObject):
        """ 
        Function Name: Append_HoseLengthList
        Function Description: This function appends objects to the Hose Length list
        """    
        self.astrHoseLength.append(strObject)

    def Remove_HoseLengthList(self, strObject):
        """ 
        Function Name: Remove_HoseLengthList
        Function Description: This function removes objects in the Hose Length list
        """    
        self.astrHoseLength.remove(strObject)

    def Get_HoseLengthList_Obj(self):
        """ 
        Function Name: Get_HoseLengthList_Obj
        Function Description: This function gets all the objects in the Hose Length list
        """    
        return self.astrHoseLength   
                
    def Get_Hose_Data(self):
        """ 
        Function Name: Get_Hose_Data
        Function Description: This function gets all the objects in the hose table
        """    
       # Create the sql query string
        sqlQuery = """SELECT * FROM THoses"""
        
        # Get the query results
        QueryResultList = SQLQueries.Load_AllData_Query(sqlQuery)
    
        # Append the housing Data List
        for i in range(len(QueryResultList)):
            Hose.Append_HoseIDList(self, QueryResultList[i][0])
            Hose.Append_HoseLengthList(self, QueryResultList[i][1]) 

    def Delete_Hose_Data(self):
        """ 
        Function Name: Delete_Hose_Data
        Function Description: This function removes all the objects in the Hose class
        """    
        del Hose.aintHoseID
        del Hose.astrHoseLength
                                
                                
class StandardHoseInspect(Hose, InspectionStatus):
    """
    Class Name: StandardHoseInspect
    Class Description: This class gets and sets all of the Standard Hose Inspection attributes. 
    Pass in the Hose and InspectionStatus classes. 
    """
    # Create class variable shared amongst all StandardHose methods
    aintStandardHoseInspectionID = []
        
    # Instantiate the following attributes
    def __init__(self, intStandardHoseInspectionID, intHoseID, intInspectionStatusID):
        # Inherits the child class with all the necessary objects
        super().__init__(intHoseID, intInspectionStatusID)
        self.intStandardHoseInspectionID = intStandardHoseInspectionID

    # Property decorator object get function to access private intStandardHoseInspectionID
    @property
    def intStandardHoseInspectionID(self):
        return self._intStandardHoseInspectionID

    # setter method 
    @intStandardHoseInspectionID.setter 
    def intStandardHoseInspectionID(self, intStandardHoseInspectionID): 
        # Return true if specified object is of int type
        if not isinstance(intStandardHoseInspectionID, int): 
            raise TypeError('ID must be an integer') 
        # Check if the value is less than zero, otherwise return true and set the ID to value
        if intStandardHoseInspectionID < 0: 
            raise ValueError('ID cannot be negative') 

        self._intStandardHoseInspectionID = intStandardHoseInspectionID 
        
    def Append_StandHoseInspectIDList(self, intObject):
        """ 
        Function Name: Append_StandHoseInspectIDList
        Function Description: This function appends objects to the Standard Hose Inspection ID list
        """    
        self.aintStandardHoseInspectionID.append(intObject)

    def Remove_StandHoseInspectIDList(self, intObject):
        """ 
        Function Name: Remove_StandHoseInspectIDList
        Function Description: This function removes objects in the Standard Hose Inspection ID list
        """    
        self.aintStandardHoseInspectionID.remove(intObject)

    def Get_StandHoseInspectIDList_Obj(self):
        """ 
        Function Name: Get_StandHoseInspectIDList_Obj
        Function Description: This function gets all the objects in the Standard Hose Inspection ID list
        """    
        return self.aintStandardHoseInspectionID
    
    def Add_StandHoseInspect_Query(self, hoseID, inStatusID):
        """ 
        Function Name: Add_StandHoseInspect_Query
        Function Description: This function updated the database with all of the necessary objects executing
        the stored procedure uspAddNewStandardHoseInspection
        """    
        # Create the sql query string
        sqlQuery = """EXEC uspAddNewStandardHoseInspection @intStandardHoseInspectionID=%d, 
                                                           @intHoseID=%d, 
                                                           @intInspectionStatusID=%d"""%(0, hoseID, inStatusID)

        # Execute the stored procedure
        SQLQueries.Exe_StoredPro_Query(sqlQuery)

    def Get_MaxStandHoseInspectID(self):
        """ 
        Function Name: Get_MaxStandHoseInspectID
        Function Description: This function gets the max ID inside the TStandardHoseInspection table
        """    
        # Create the sql query string
        sqlQuery = """SELECT MAX(intStandardHoseInspectionID) FROM TStandardHoseInspections"""
        QueryID = int(0)

        # Execute the query
        self.intStandardHoseInspectionID = SQLQueries.Get_SingleValue_Query(sqlQuery, QueryID)
                
    def Delete_StandHoseInspect_Data(self):
        """ 
        Function Name: Delete_StandHoseInspect_Data
        Function Description: This function removes all the objects in the Standard Hose Inspection class
        """    
        del StandardHoseInspect.aintStandardHoseInspectionID
        
                
class Handle():
    """
    Class Name: Handle
    Class Description: This class gets and sets all of the Handle attributes. 
    """
    # Create class variable shared amongst all Handle methods
    aintHandleID = []
    astrHandleType = []
    
    # Instantiate the following attributes
    def __init__(self, intHandleID, strHandleType):
        self.intHandleID = intHandleID
        self.strHandleType = strHandleType

    # Property decorator object get function to access private intHandleID
    @property
    def intHandleID(self):
        return self._intHandleID

    # Property decorator object get function to access private strHandleType
    @property
    def strHandleType(self):
        return self._strHandleType

    # setter method 
    @intHandleID.setter 
    def intHandleID(self, intHandleID): 
        # Return true if specified object is of int type
        if not isinstance(intHandleID, int): 
            raise TypeError('ID must be an integer') 
        # Check if the value is less than zero, otherwise return true and set the ID to value
        if intHandleID < 0: 
            raise ValueError('ID cannot be negative') 

        self._intHandleID = intHandleID 
        
    # setter method 
    @strHandleType.setter 
    def strHandleType(self, strHandleType): 
        # Return true if specified object is of str type
        if not isinstance(strHandleType, str): 
            raise TypeError('Handle Type must be a string') 
        # Check if the value is empty, otherwise check if the value is alpha
        if strHandleType.isspace(): 
            raise ValueError('Handle Type cannot be empty') 
        # Set the attribute to the value if true
        elif strHandleType.isalpha():
            self._strHandleType = strHandleType

    def Append_HandleIDList(self, intObject):
        """ 
        Function Name: Append_HandleIDList
        Function Description: This function appends objects to the Handle ID list
        """    
        self.aintHandleID.append(intObject)

    def Remove_HandleIDList(self, intObject):
        """ 
        Function Name: Remove_HandleIDList
        Function Description: This function removes objects in the Handle ID list
        """    
        self.aintHandleID.remove(intObject)

    def Get_HandleIDList_Obj(self):
        """ 
        Function Name: Get_HandleIDList_Obj
        Function Description: This function gets all the objects in the Handle ID list
        """    
        return self.aintHandleID
    
    def Append_HandleTypeList(self, strObject):
        """ 
        Function Name: Append_HandleTypeList
        Function Description: This function appends objects to the Handle Type list
        """    
        self.astrHandleType.append(strObject)

    def Remove_HandleTypeList(self, strObject):
        """ 
        Function Name: Remove_HandleTypeList
        Function Description: This function removes objects in the Handle Type list
        """    
        self.astrHandleType.remove(strObject)

    def Get_HandleTypeList_Obj(self):
        """ 
        Function Name: Get_HandleTypeList_Obj
        Function Description: This function gets all the objects in the Handle Type list
        """    
        return self.astrHandleType  

    def Get_Handel_Data(self):
        """ 
        Function Name: Get_Handel_Data
        Function Description: This function gets all the objects in the handle table
        """    
       # Create the sql query string
        sqlQuery = """SELECT * FROM THandles"""
        
        # Get the query results
        QueryResultList = SQLQueries.Load_AllData_Query(sqlQuery)
    
        # Append the housing Data List
        for i in range(len(QueryResultList)):
            Handle.Append_HandleIDList(self, QueryResultList[i][0])
            Handle.Append_HandleTypeList(self, QueryResultList[i][1]) 

    def Delete_Handle_Data(self):
        """ 
        Function Name: Delete_Handle_Data
        Function Description: This function removes all the objects in the Handle class
        """    
        del Handle.aintHandleID
        del Handle.astrHandleType
        

class StandardHandelInspect(Handle, InspectionStatus):
    """
    Class Name: StandardHandelInspect
    Class Description: This class gets and sets all of the Standard Handel Inspection attributes. 
    Pass in the Handel and InspectionStatus classes. 
    """
    # Create class variable shared amongst all Standard Handel methods
    aintStandardHandleInspectionID = []
        
    # Instantiate the following attributes
    def __init__(self, intStandardHandleInspectionID, intHandleID, intInspectionStatusID):
        # Inherits the child class with all the necessary objects
        super().__init__(intHandleID, intInspectionStatusID)
        self.intStandardHandleInspectionID = intStandardHandleInspectionID

    # Property decorator object get function to access private intStandardHandleInspectionID
    @property
    def intStandardHandleInspectionID(self):
        return self._intStandardHandleInspectionID
    
    # setter method 
    @intStandardHandleInspectionID.setter 
    def intStandardHandleInspectionID(self, intStandardHandleInspectionID): 
        # Return true if specified object is of int type
        if not isinstance(intStandardHandleInspectionID, int): 
            raise TypeError('ID must be an integer') 
        # Check if the value is less than zero, otherwise return true and set the ID to value
        if intStandardHandleInspectionID < 0:             
            raise ValueError('ID cannot be negative') 

        self._intStandardHandleInspectionID = intStandardHandleInspectionID 

    def Append_StandHoseInspectIDList(self, intObject):
        """ 
        Function Name: Append_StandHoseInspectIDList
        Function Description: This function appends objects to the Standard Hose Inspection ID list
        """    
        self.aintStandardHandleInspectionID.append(intObject)
        
    def Remove_StandHoseInspectIDList(self, intObject):
        """ 
        Function Name: Remove_StandHoseInspectIDList
        Function Description: This function removes objects in the Standard Hose Inspection ID list
        """    
        self.aintStandardHandleInspectionID.remove(intObject)

    def Get_StandHoseInspectIDList_Obj(self):
        """ 
        Function Name: Get_StandHoseInspectIDList_Obj
        Function Description: This function gets all the objects in the Standard Hose Inspection ID list
        """    
        return self.aintStandardHandleInspectionID

    def Add_StandHandleInspect_Query(self, handleID, inspectStatusID):
        """ 
        Function Name: Add_StandHandleInspect_Query
        Function Description: This function updated the database with all of the necessary objects executing
        the stored procedure uspAddNewStandardHandleInspection
        """    
        # Create the sql query string
        sqlQuery = """EXEC uspAddNewStandardHandleInspection @intStandardHandleInspectionID=%d, 
                                                             @intHandleID=%d, 
                                                             @intInspectionStatusID=%d"""%(0, handleID, inspectStatusID)

        # Execute the stored procedure
        SQLQueries.Exe_StoredPro_Query(sqlQuery)
            
    def Get_MaxStandHandleInspectID(self):
        """ 
        Function Name: Get_MaxStandHandleInspectID
        Function Description: This function gets the max ID inside the TStandardHandleInspections table
        """    
        # Create the sql query string
        sqlQuery = """SELECT MAX(intStandardHandleInspectionID) FROM TStandardHandleInspections"""
        QueryID = int(0)

        # Execute the query
        self.intStandardHandleInspectionID = SQLQueries.Get_SingleValue_Query(sqlQuery, QueryID)
        
    def Delete_StandHandleInspect_Data(self):
        """ 
        Function Name: Delete_StandHandleInspect_Data
        Function Description: This function removes all the objects in the Standard Handle Inspection class
        """    
        del StandardHandelInspect.aintStandardHandleInspectionID
        
                        
class PressGuage():
    """
    Class Name: PressGuage
    Class Description: This class gets and sets all of the Pressure Guage attributes. 
    """
    # Create class variable shared amongst all Pressure Guage methods
    aintPressGuageID = []
    astrPressureType = []
    astrPressureRange = []
        
    # Instantiate the following attributes
    def __init__(self, intPressGuageID, strPressureType, strPressureRange):
        self.intPressGuageID = intPressGuageID
        self.strPressureType = strPressureType
        self.strPressureRange = strPressureRange

    # Property decorator object get function to access private intPressGuageID
    @property
    def intPressGuageID(self):
        return self._intPressGuageID

    # Property decorator object get function to access private strPressureType
    @property
    def strPressureType(self):
        return self._strPressureType
    
    # Property decorator object get function to access private strPressureRange
    @property
    def strPressureRange(self):
        return self._strPressureRange

    # setter method 
    @intPressGuageID.setter 
    def intPressGuageID(self, intPressGuageID): 
        # Return true if specified object is of int type
        if not isinstance(intPressGuageID, int):             
            raise TypeError('ID must be an integer') 
        # Check if the value is less than zero, otherwise return true and set the ID to value
        if intPressGuageID < 0:             
            raise ValueError('ID cannot be negative') 

        self._intPressGuageID = intPressGuageID    

    # setter method 
    @strPressureType.setter 
    def strPressureType(self, strPressureType): 
        # Return true if specified object is of str type
        if not isinstance(strPressureType, str):             
            raise TypeError('Pressure Type must be a string') 
        # Check if the value is empty, otherwise return if the value is alpha
        if strPressureType.isspace():             
            raise ValueError('Pressure Type cannot be empty') 
        # Set the attribute to the value if true
        elif strPressureType.isalpha():
            self._strPressureType = strPressureType
            
    # setter method 
    @strPressureRange.setter 
    def strPressureRange(self, strPressureRange): 
        # Return true if specified object is of str type
        if not isinstance(strPressureRange, str):             
            raise TypeError('Pressure Range must be a string') 
        # Check if the value is empty, otherwise return if the value is alpha numeric
        if strPressureRange.isspace():             
            raise ValueError('Pressure Range cannot be empty') 
        # Set the attribute to the value if true
        elif strPressureRange.isalnum():
            self._strPressureRange = strPressureRange

    def Append_PressGuageIDList(self, intObject):
        """ 
        Function Name: Append_PressGuageIDList
        Function Description: This function appends objects to the Pressure Guage ID list
        """    
        self.aintPressGuageID.append(intObject)

    def Remove_PressGuageIDList(self, intObject):
        """ 
        Function Name: Remove_PressGuageIDList
        Function Description: This function removes objects in the Pressure Guage ID list
        """    
        self.aintPressGuageID.remove(intObject)

    def Get_PressGuageIDList_Obj(self):
        """ 
        Function Name: Get_PressGuageIDList_Obj
        Function Description: This function gets all the objects in the Pressure Guage ID list
        """    
        return self.aintPressGuageID            

    def Append_PressGuageTypeList(self, strObject):
        """ 
        Function Name: Append_PressGuageTypeList
        Function Description: This function appends objects to the Pressure Guage Type list
        """    
        self.astrPressureType.append(strObject)

    def Remove_PressGuageTypeList(self, strObject):
        """ 
        Function Name: Remove_PressGuageTypeList
        Function Description: This function removes objects in the Pressure Guage Type list
        """    
        self.astrPressureType.remove(strObject)

    def Get_PressGuageTypeList_Obj(self):
        """ 
        Function Name: Get_PressGuageTypeList_Obj
        Function Description: This function gets all the objects in the Pressure Guage Type list
        """    
        return self.astrPressureType  
    
    def Append_PressGuageRangeList(self, strObject):
        """ 
        Function Name: Append_PressGuageRangeList
        Function Description: This function appends objects to the Pressure Guage Range list
        """    
        self.astrPressureRange.append(strObject)

    def Remove_PressGuageRangeList(self, strObject):
        """ 
        Function Name: Remove_PressGuageRangeList
        Function Description: This function removes objects in the Pressure Guage Range list
        """    
        self.astrPressureRange.remove(strObject)

    def Get_PressGuageRangeList_Obj(self):
        """ 
        Function Name: Get_PressGuageRangeList_Obj
        Function Description: This function gets all the objects in the Pressure Guage Range list
        """    
        return self._astrPressureRange 

    def Get_PressGuage_Data(self):
        """ 
        Function Name: Get_PressGuage_Data
        Function Description: This function gets all the objects in the pressure guage table
        """    
        # Get the query results
        QueryIDResultList = SQLQueries.Load_PressGuageID_Query()
        QueryArgOneResultList = SQLQueries.Load_PressGuageType_Query()
        QueryArgTwoResultList = SQLQueries.Load_PressGuageRange_Query()
        
        # Append the Pressure Guage List
        for i in range(len(QueryIDResultList)):
            PressGuage.Append_PressGuageIDList(self, QueryIDResultList[i])

        # Append the Pressure Gugage Type List    
        for j in range(len(QueryArgOneResultList)):         
            PressGuage.Append_PressGuageTypeList(self, QueryArgOneResultList[j])
        
        # Append the Pressure Guage Range List
        for k in range(len(QueryArgTwoResultList)):         
            PressGuage.Append_PressGuageRangeList(self, QueryArgTwoResultList[k]) 
                       
    def Delete_PressGuage_Data(self):
        """ 
        Function Name: Delete_PressGuage_Data
        Function Description: This function removes all the objects in the Pressure Guage class
        """    
        del PressGuage.aintPressGuageID
        del PressGuage.astrPressureType
        del PressGuage.astrPressureRange
        
                                        
class StandardPressGuageInspect(PressGuage, InspectionStatus):
    """
    Class Name: StandardPressGuageInspect
    Class Description: This class gets and sets all of the Standard Pressure Guage Inspection attributes. 
    Pass in the Pressure Guage and InspectionStatus classes. 
    """
    # Create class variable shared amongst all Standard Pressure Guage methods
    aintStandardPressGuagueInspectionID = []
        
    # Instantiate the following attributes
    def __init__(self, intStandardPressGuagueInspectionID, intPressGuageID, intInspectionStatusID):
        # Inherits the child class with all the necessary objects
        super().__init__(intPressGuageID, intInspectionStatusID)
        self.intStandardPressGuagueInspectionID = intStandardPressGuagueInspectionID

    # Property decorator object get function to access private intStandardPressGuagueInspectionID
    @property
    def intStandardPressGuagueInspectionID(self):
        return self._intStandardPressGuagueInspectionID
    
    # setter method 
    @intStandardPressGuagueInspectionID.setter 
    def intStandardPressGuagueInspectionID(self, intStandardPressGuagueInspectionID): 
        # Return true if specified object is of int type
        if not isinstance(intStandardPressGuagueInspectionID, int): 
            raise TypeError('ID must be an integer') 
        # Check if the value is less than zero, otherwise return true and set the ID to value
        if intStandardPressGuagueInspectionID < 0: 
            raise ValueError('ID cannot be negative') 

        self.intStandardPressGuagueInspectionID = intStandardPressGuagueInspectionID 
            
    def Append_StandPressGuageInspectIDList(self, intObject):
        """ 
        Function Name: Append_StandPressGuageInspectIDList
        Function Description: This function appends objects to the Standard Pressure Guage Inspection ID list
        """    
        self.aintStandardPressGuagueInspectionID.append(intObject)

    def Remove_StandPressGuageInspectIDList(self, intObject):
        """ 
        Function Name: Remove_StandPressGuageInspectIDList
        Function Description: This function removes objects in the Standard Pressure Guage Inspection ID list
        """    
        self.aintStandardPressGuagueInspectionID.remove(intObject)

    def Get_StandPressGuageInspectIDList_Obj(self):
        """ 
        Function Name: Get_StandPressGuageInspectIDList_Obj
        Function Description: This function gets all the objects in the Standard Pressure Guage Inspection ID list
        """    
        return self.aintStandardPressGuagueInspectionID            
    
    def Add_StandPressGuageInspect_Query(self, pressGuageID, inspectStatusID):
        """ 
        Function Name: Add_StandPressGuageInspect_Query
        Function Description: This function updated the database with all of the necessary objects executing
        the stored procedure uspAddNewStandardPressGuagueInspection
        """    
        # Create the sql query string
        sqlQuery = """EXEC uspAddNewStandardPressGuagueInspection @intStandardPressGuageInspectionID=%d, 
                                                                  @intPressGuageID=%d, 
                                                                  @intInspectionStatusID=%d"""%(0, pressGuageID, inspectStatusID)

        # Execute the stored procedure
        SQLQueries.Exe_StoredPro_Query(sqlQuery)
        
    def Get_MaxPressGuageInspectID(self):
        """ 
        Function Name: Get_MaxPressGuageInspectID
        Function Description: This function gets the max ID inside the TStandardPressGuageInspections table
        """    
        # Create the sql query string
        sqlQuery = """SELECT MAX(intStandardPressGuageInspectionID) FROM TStandardPressGuageInspections"""
        QueryID = int(0)

        # Execute the query
        self.intStandardPressGuagueInspectionID = SQLQueries.Get_SingleValue_Query(sqlQuery, QueryID)
        
    def Delete_StandPressGuageInspect_Data(self):
        """ 
        Function Name: Delete_StandPressGuageInspect_Data
        Function Description: This function removes all the objects in the Standard Pressure Guage Inspection class
        """    
        del StandardPressGuageInspect.aintStandardPressGuagueInspectionID

                                    
class Case():
    """
    Class Name: Case
    Class Description: This class gets and sets all of the Case attributes. 
    """
    # Create class variable shared amongst all Case methods
    aintCaseID = []
    astrCaseWeight = []
    astrCaseAgents = []
        
    # Instantiate the following attributes
    def __init__(self, intCaseID, strCaseWeight, strCaseAgents):
        self.intCaseID = intCaseID
        self.strCaseWeight = strCaseWeight
        self.strCaseAgents = strCaseAgents
        
    # Property decorator object get function to access private intCaseID
    @property
    def intCaseID(self):
        return self._intCaseID

    # Property decorator object get function to access private strCaseWeight
    @property
    def strCaseWeight(self):
        return self._strCaseWeight

    # Property decorator object get function to access private strCaseAgents
    @property
    def strCaseAgents(self):
        return self._strCaseAgents      

    # setter method 
    @intCaseID.setter 
    def intCaseID(self, intCaseID): 
        # Return true if specified object is of int type
        if not isinstance(intCaseID, int): 
            raise TypeError('ID must be an integer') 
        # Check if the value is less than zero, otherwise return true and set the ID to value
        if intCaseID < 0: 
            raise ValueError('ID cannot be negative') 

        self._intCaseID = intCaseID    

    # setter method 
    @strCaseWeight.setter 
    def strCaseWeight(self, strCaseWeight): 
        # Return true if specified object is of str type
        if not isinstance(strCaseWeight, str): 
            raise TypeError('Case Weight must be a string') 
        # Check if the value is empty, otherwise return if the value is alpha numeric
        if strCaseWeight.isspace(): 
            raise ValueError('Case Weight cannot be empty') 
        # Set the attribute to the value if true
        elif strCaseWeight.isalnum():
            self._strCaseWeight = strCaseWeight
            
    # setter method 
    @strCaseAgents.setter 
    def strCaseAgents(self, strCaseAgents): 
        # Return true if specified object is of str type
        if not isinstance(strCaseAgents, str): 
            raise TypeError('Case Agent must be a string') 
        # Check if the value is empty, otherwise return if the value is alpha numeric 
        if strCaseAgents.isspace(): 
            raise ValueError('Case Agent cannot be empty') 
        # Set the attribute to the value if true
        elif strCaseAgents.isalnum():
            self._strPressureRange = strCaseAgents
                    
    def Append_CaseIDList(self, intObject):
        """ 
        Function Name: Append_CaseIDList
        Function Description: This function appends objects to the Case ID list
        """    
        self.aintCaseID.append(intObject)

    def Remove_CaseIDList(self, intObject):
        """ 
        Function Name: Remove_CaseIDList
        Function Description: This function removes objects in the Case ID list
        """    
        self.aintCaseID.remove(intObject)

    def Get_CaseIDList_Obj(self):
        """ 
        Function Name: Get_CaseIDList_Obj
        Function Description: This function gets all the objects in the Case ID list
        """    
        return self.aintCaseID            

    def Append_CaseWeightList(self, strObject):
        """ 
        Function Name: Append_CaseWeightList
        Function Description: This function appends objects to the Case Weight list
        """    
        self.astrCaseWeight.append(strObject)

    def Remove_CaseWeightList(self, strObject):
        """ 
        Function Name: Remove_CaseWeightList
        Function Description: This function removes objects in the Case Weight list
        """    
        self.astrCaseWeight.remove(strObject)

    def Get_CaseWeightList_Obj(self):
        """ 
        Function Name: Get_CaseWeightList_Obj
        Function Description: This function gets all the objects in the Case Weight list
        """    
        return self.astrCaseWeight  
    
    def Append_CaseAgentList(self, strObject):
        """ 
        Function Name: Append_CaseAgentList
        Function Description: This function appends objects to the Case Agent list
        """    
        self.astrCaseAgents.append(strObject)

    def Remove_CaseAgentList(self, strObject):
        """ 
        Function Name: Remove_CaseAgentList
        Function Description: This function removes objects in the Case Agent list
        """    
        self.astrCaseAgents.remove(strObject)

    def Get_CaseAgentList_Obj(self):
        """ 
        Function Name: Get_CaseAgentList_Obj
        Function Description: This function gets all the objects in the Case Agent list
        """    
        return self.astrCaseAgents 
    
    def Get_Case_Data(self):
        """ 
        Function Name: Get_Case_Data
        Function Description: This function gets all the objects in the pressure guage table
        """    
        # Get the query results
        QueryIDResultList = SQLQueries.Load_CaseID_Query()
        QueryArgOneResultList = SQLQueries.Load_CaseWeight_Query()
        QueryArgTwoResultList = SQLQueries.Load_CaseAgent_Query()
        
        # Append the Pressure Guage List
        for i in range(len(QueryIDResultList)):
            Case.Append_CaseIDList(self, QueryIDResultList[i])

        # Append the Pressure Gugage Type List    
        for j in range(len(QueryArgOneResultList)):         
            Case.Append_CaseWeightList(self, QueryArgOneResultList[j])
        
        # Append the Pressure Guage Range List
        for k in range(len(QueryArgTwoResultList)):  
            Case.Append_CaseAgentList(self, QueryArgTwoResultList[k]) 
                
    def Delete_Case_Data(self):
        """ 
        Function Name: Delete_Case_Data
        Function Description: This function removes all the objects in the Case class
        """    
        del Case.aintCaseID
        del Case.astrCaseWeight
        del Case.astrCaseAgents

                
class StandardCaseInspect(Case, InspectionStatus):
    """
    Class Name: StandardCaseInspect
    Class Description: This class gets and sets all of the Standard Case Inspection attributes. 
    Pass in the Case and InspectionStatus classes. 
    """
    # Create class variable shared amongst all Standard Case methods
    aintStandardCaseInspectionID = []
        
    # Instantiate the following attributes
    def __init__(self, intStandardCaseInspectionID, intCaseID, intInspectionStatusID):
        # Inherits the child class with all the necessary objects
        super().__init__(intCaseID, intInspectionStatusID)
        self.intStandardCaseInspectionID = intStandardCaseInspectionID

    # Property decorator object get function to access private intStandardCaseInspectionID
    @property
    def intStandardCaseInspectionID(self):
        return self._intStandardCaseInspectionID
    
    # setter method 
    @intStandardCaseInspectionID.setter 
    def intStandardCaseInspectionID(self, intStandardCaseInspectionID): 
        # Return true if specified object is of int type
        if not isinstance(intStandardCaseInspectionID, int): 
            raise TypeError('ID must be an integer') 
        # Check if the value is less than zero, otherwise return true and set the ID to value
        if intStandardCaseInspectionID < 0: 
            raise ValueError('ID cannot be negative') 

        self._intStandardCaseInspectionID = intStandardCaseInspectionID   

    def Append_StandCaseInspectIDList(self, intObject):
        """ 
        Function Name: Append_StandCaseInspectIDList
        Function Description: This function appends objects to the Standard Case Inspection ID list
        """    
        self.aintStandardCaseInspectionID.append(intObject)

    def Remove_StandCaseInspectIDList(self, intObject):
        """ 
        Function Name: Remove_StandCaseInspectIDList
        Function Description: This function removes objects in the Standard Case Inspection ID list
        """    
        self.aintStandardCaseInspectionID.remove(intObject)

    def Get_StandCaseInspectIDList_Obj(self):
        """ 
        Function Name: Get_StandCaseInspectIDList_Obj
        Function Description: This function gets all the objects in the Standard Case Inspection ID list
        """    
        return self.aintStandardCaseInspectionID            
    
    def Add_StandCaseInspect_Query(self, caseID, inspectStatusID):
        """ 
        Function Name: Add_StandCaseInspect_Query
        Function Description: This function updated the database with all of the necessary objects executing
        the stored procedure uspAddNewStandardCaseInspection
        """    
        # Create the sql query string
        sqlQuery = """EXEC uspAddNewStandardCaseInspection @intStandardPressGuageInspectionID=%d, 
                                                           @intPressGuageID=%d, 
                                                           @intInspectionStatusID=%d"""%(0, caseID, inspectStatusID)

        # Execute the stored procedure
        SQLQueries.Exe_StoredPro_Query(sqlQuery)
        
    def Get_MaxCaseInspectID(self):
        """ 
        Function Name: Get_MaxCaseInspectID
        Function Description: This function gets the max ID inside the TStandardCaseInspections table
        """    
        # Create the sql query string
        sqlQuery = """SELECT MAX(intStandardCaseInspectionID) FROM TStandardCaseInspections"""
        QueryID = int(0)

        # Execute the query
        self.intStandardCaseInspectionID = SQLQueries.Get_SingleValue_Query(sqlQuery, QueryID)
        
    def Delete_StandCaseInspect_Data(self):
        """ 
        Function Name: Delete_StandCaseInspect_Data
        Function Description: This function removes all the objects in the Standard Case Inspection class
        """    
        del StandardCaseInspect.aintStandardCaseInspectionID
        
                
class Housing():
    """
    Class Name: Housing
    Class Description: This class gets and sets all of the Housing attributes. 
    """
    # Create class variable shared amongst all Housing methods
    aintHousingID = []
    astrHousingDesc = []    
    
    # Instantiate the following attributes
    def __init__(self, intHousingID, strHousingDesc):
        self.intHousingID = intHousingID
        self.strHousingDesc = strHousingDesc

    # Property decorator object get function to access private intHousingID
    @property
    def intHousingID(self):
        return self._intHousingID

    # Property decorator object get function to access private strHousingDesc
    @property
    def strHousingDesc(self):
        return self._strHousingDesc

    # setter method 
    @intHousingID.setter 
    def intHousingID(self, intHousingID): 
        # Return true if specified object is of int type
        if not isinstance(intHousingID, int): 
            raise TypeError('ID must be an integer') 
        # Check if the value is less than zero, otherwise return true and set the ID to value
        if intHousingID < 0: 
            raise ValueError('ID cannot be negative') 

        self._intHousingID = intHousingID    

    # setter method 
    @strHousingDesc.setter 
    def strHousingDesc(self, strHousingDesc): 
        # Return true if specified object is of str type
        if not isinstance(strHousingDesc, str): 
            raise TypeError('Housing Description must be a string') 
        # Check if the value is empty, otherwise check if the value is alpha 
        if strHousingDesc.isspace(): 
            raise ValueError('Housing Description cannot be empty') 
        # Set the attribute to the value if true
        elif strHousingDesc.isalpha():
            self._strHousingDesc = strHousingDesc
            
    def Append_HouseIDList(self, intObject):
        """ 
        Function Name: Append_HouseIDList
        Function Description: This function appends objects to the House ID list
        """    
        self.aintHousingID.append(intObject)

    def Remove_HouseIDList(self, intObject):
        """ 
        Function Name: Remove_HouseIDList
        Function Description: This function removes objects in the House ID list
        """    
        self.aintHousingID.remove(intObject)

    def Get_HouseIDList_Obj(self):
        """ 
        Function Name: Get_HouseIDList_Obj
        Function Description: This function gets all the objects in the House ID list
        """    
        return self.aintHousingID            

    def Append_HouseDescList(self, strObject):
        """ 
        Function Name: Append_HouseDescList
        Function Description: This function appends objects to the House Description list
        """    
        self.astrHousingDesc.append(strObject)

    def Remove_HouseDescList(self, strObject):
        """ 
        Function Name: Remove_HouseDescList
        Function Description: This function removes objects in the House Description list
        """    
        self.astrHousingDesc.remove(strObject)

    def Get_HouseDescList_Obj(self):
        """ 
        Function Name: Get_HouseDescList_Obj
        Function Description: This function gets all the objects in the House Description list
        """    
        return self.astrHousingDesc  

    def Get_Housing_Data(self):
        """ 
        Function Name: Get_Housing_Data
        Function Description: This function gets all the objects in the housing table
        """    
        # Create the sql query string
        sqlQuery = """SELECT * FROM THousings"""
        
        # Get the query results
        QueryResultList = SQLQueries.Load_AllData_Query(sqlQuery)
    
        # Append the housing Data List
        for i in range(len(QueryResultList)):
            Housing.Append_HouseIDList(self, QueryResultList[i][0])
            Housing.Append_HouseDescList(self, QueryResultList[i][1]) 
            
    def Delete_Housing_Data(self):
        """ 
        Function Name: Delete_Housing_Data
        Function Description: This function removes all the objects in the Housing class
        """    
        del Housing.aintHousingID
        del Housing.astrHousingDesc
                    
                
class StandardHouseInspect(Housing, InspectionStatus):
    """
    Class Name: StandardHouseInspect
    Class Description: This class gets and sets all of the Standard Housing Inspection attributes. 
    Pass in the Housing and InspectionStatus classes. 
    """
    # Create class variable shared amongst all Standard Housing methods
    aintStandardHousingInspectionID = []
        
    # Instantiate the following attributes
    def __init__(self, intStandardHousingInspectionID, intHousingID, intInspectionStatusID):
        # Inherits the child class with all the necessary objects
        super().__init__(intHousingID, intInspectionStatusID)
        self.intStandardHousingInspectionID = intStandardHousingInspectionID

    # Property decorator object get function to access private intStandardHousingInspectionID
    @property
    def intStandardHousingInspectionID(self):
        return self._intStandardHousingInspectionID
    
    # setter method 
    @intStandardHousingInspectionID.setter 
    def intStandardHousingInspectionID(self, intStandardHousingInspectionID): 
        # Return true if specified object is of int type
        if not isinstance(intStandardHousingInspectionID, int): 
            raise TypeError('ID must be an integer') 
        # Check if the value is less than zero, otherwise return true and set the ID to value
        if intStandardHousingInspectionID < 0: 
            raise ValueError('ID cannot be negative') 

        self._intStandardHousingInspectionID = intStandardHousingInspectionID    

    def Append_StandHouseInspectIDList(self, intObject):
        """ 
        Function Name: Append_StandHouseInspectIDList
        Function Description: This function appends objects to the Standard Housing Inspection ID list
        """    
        self.aintStandardHousingInspectionID.append(intObject)

    def Remove_StandHouseInspectIDList(self, intObject):
        """ 
        Function Name: Remove_StandHouseInspectIDList
        Function Description: This function removes objects in the Standard Housing Inspection ID list
        """    
        self.aintStandardHousingInspectionID.remove(intObject)

    def Get_StandHouseInspectIDList_Obj(self):
        """ 
        Function Name: Get_StandHouseInspectIDList_Obj
        Function Description: This function gets all the objects in the Standard Housing Inspection ID list
        """    
        return self.aintStandardHousingInspectionID            

    def Add_StandHousingInspect_Query(self, houseID, inspectStatusID):
        """ 
        Function Name: Add_StandHousingInspect_Query
        Function Description: This function updated the database with all of the necessary objects executing
        the stored procedure uspAddNewStandardHousingInspection
        """    
        # Create the sql query string
        sqlQuery = """EXEC uspAddNewStandardHousingInspection @intStandardHousingInspectionID=%d, 
                                                              @intHousingID=%d, 
                                                              @intInspectionStatusID=%d"""%(0, houseID, inspectStatusID)

        # Execute the stored procedure
        SQLQueries.Exe_StoredPro_Query(sqlQuery)
            
    def Get_MaxHousingInspectID(self):
        """ 
        Function Name: Get_MaxHousingInspectID
        Function Description: This function gets the max ID inside the TStandardHousingInspections table
        """    
        # Create the sql query string
        sqlQuery = """SELECT MAX(intStandardHousingInspectionID) FROM TStandardHousingInspections"""
        QueryID = int(0)

        # Execute the query
        self.intStandardHousingInspectionID = SQLQueries.Get_SingleValue_Query(sqlQuery, QueryID)
        
    def Delete_StandHousingInspect_Data(self):
        """ 
        Function Name: Delete_StandHousingInspect_Data
        Function Description: This function removes all the objects in the Standard Housing Inspection class
        """    
        del StandardHouseInspect.aintStandardHousingInspectionID
       
                                
class States():
    """
    Class Name: States
    Class Description: This class gets and sets all of the States attributes. 
    """
    # Create class variable shared amongst all State methods
    aintStateIDList = []
    astrStateName = []   
        
    # Instantiate the following attributes
    def __init__(self, intStateID, strStateName):
        self.intStateID = intStateID
        self.strStateName = strStateName

    # Property decorator object get function to access private intStateID
    @property
    def intStateID(self):
        return self._intStateID

    # Property decorator object get function to access private strStateName
    @property
    def strStateName(self):
        return self._strStateName
    
    # setter method 
    @intStateID.setter 
    def intStateID(self, intStateID): 
        # Return true if specified object is of int type
        if not isinstance(intStateID, int): 
            raise TypeError('ID must be an integer') 
        # Check if the value is less than zero, otherwise return true and set the ID to value
        if intStateID < 0: 
            raise ValueError('ID cannot be negative') 

        self._intStateID = intStateID    

    # setter method 
    @strStateName.setter 
    def strStateName(self, strStateName): 
        # Return true if specified object is of str type
        if not isinstance(strStateName, str): 
            raise TypeError('State must be a string') 
        # Check if the value is empty, otherwise check if the value is alpha 
        if strStateName.isspace(): 
            raise ValueError('State cannot be empty') 
        # Set the attribute to the value if true
        elif strStateName.isalpha():
            self._strStateName = strStateName
       
    def Append_StateIDList(self, intObject):
        """ 
        Function Name: Append_StateIDList
        Function Description: This function appends objects to the State ID list
        """    
        self.aintStateIDList.append(intObject)

    def Remove_StateIDList(self, intObject):
        """ 
        Function Name: Remove_StateIDList
        Function Description: This function removes objects in the State ID list
        """    
        self.aintStateIDList.remove(intObject)

    def Get_StateIDList_Obj(self):
        """ 
        Function Name: Get_StateIDList_Obj
        Function Description: This function gets all the objects in the State ID list
        """    
        return self.aintStateIDList            

    def Append_StateNameList(self, strObject):
        """ 
        Function Name: Append_StateNameList
        Function Description: This function appends objects to the State Name list
        """    
        self.astrStateName.append(strObject)

    def Remove_StateNameList(self, strObject):
        """ 
        Function Name: Remove_StateNameList
        Function Description: This function removes objects in the State Name list
        """    
        self.astrStateName.remove(strObject)

    def Get_StateNameList_Obj(self):
        """ 
        Function Name: Get_StateNameList_Obj
        Function Description: This function gets all the objects in the State Name list
        """    
        return self.astrStateName       
            
    def Get_State_Data(self):
        """ 
        Function Name: Get_State_Data
        Function Description: This function gets all the objects in the state table
        """    
        # Create the sql query string
        sqlQuery = """SELECT * FROM TStates"""
        
        # Get the query results
        QueryResultList = SQLQueries.Load_AllData_Query(sqlQuery)
    
        # Append the State Data List
        for i in range(len(QueryResultList)):
            States.Append_StateIDList(self, QueryResultList[i][0])
            States.Append_StateNameList(self, QueryResultList[i][1]) 

    def Delete_State_Data(self):
        """ 
        Function Name: Delete_State_Data
        Function Description: This function removes all the objects in the State class
        """   
        del States.aintStateIDList
        del States.astrStateName
        
                    
class Location():
    """
    Class Name: Location
    Class Description: This class gets and sets all of the Location attributes. 
    """
    # Create class variable shared amongst all Location methods
    aintLocationID = []
    astrLocationDesc = []
        
    # Instantiate the following attributes
    def __init__(self, intLocationID, strLocationDesc):
        self.intLocationID = intLocationID
        self.strLocationDesc = strLocationDesc

    # Property decorator object get function to access private intLocationID
    @property
    def intLocationID(self):
        return self._intLocationID

    # Property decorator object get function to access private strLocationDesc
    @property
    def strLocationDesc(self):
        return self._strLocationDesc
    
    # setter method 
    @intLocationID.setter 
    def intLocationID(self, intLocationID): 
        # Return true if specified object is of int type
        if not isinstance(intLocationID, int): 
            raise TypeError('ID must be an integer') 
        # Check if the value is less than zero, otherwise return true and set the ID to value
        if intLocationID < 0: 
            raise ValueError('ID cannot be negative') 

        self._intLocationID = intLocationID    

    # setter method 
    @strLocationDesc.setter 
    def strLocationDesc(self, strLocationDesc): 
        # Return true if specified object is of str type
        if not isinstance(strLocationDesc, str): 
            raise TypeError('Location must be a string') 
        # Check if the value is empty, otherwise check if the value is alpha 
        if strLocationDesc.isspace(): 
            raise ValueError('Location cannot be empty') 

        self._strLocationDesc= strLocationDesc   
            
    def Append_LocationIDList(self, intObject):
        """ 
        Function Name: Append_LocationIDList
        Function Description: This function appends objects to the Location ID list
        """    
        self.aintLocationID.append(intObject)

    def Remove_LocationIDList(self, intObject):
        """ 
        Function Name: Remove_LocationIDList
        Function Description: This function removes objects in the Location ID list
        """    
        self.aintLocationID.remove(intObject)

    def Get_LocationIDList_Obj(self):
        """ 
        Function Name: Get_LocationIDList_Obj
        Function Description: This function gets all the objects in the Location ID list
        """    
        return self.aintLocationID               

    def Append_LocationNameList(self, strObject):
        """ 
        Function Name: Append_LocationNameList
        Function Description: This function appends objects to the Fire Ex Location Name list
        """    
        self.astrLocationDesc.append(strObject)

    def Remove_LocationNameList(self, strObject):
        """ 
        Function Name: Remove_LocationNameList
        Function Description: This function removes objects in the Fire Ex Location Name list
        """    
        self.astrLocationDesc.remove(strObject)

    def Get_LocationNameList_Obj(self):
        """ 
        Function Name: Get_LocationNameList_Obj
        Function Description: This function gets all the objects in the Fire Ex Location Name list
        """    
        return self.astrLocationDesc  
    
    def Get_Location_Data(self):
        """ 
        Function Name: Get_Location_Data
        Function Description: This function gets all the objects in the Locations table
        """    
        # Create the sql query string
        sqlQuery = """SELECT * FROM TLocations"""
        
        # Get the query results
        QueryResultList = SQLQueries.Load_AllData_Query(sqlQuery)
    
        # Append the Hose Data List
        for i in range(len(QueryResultList)):
            Location.Append_LocationIDList(self, QueryResultList[i][0])
            Location.Append_LocationNameList(self, QueryResultList[i][1]) 

    def Delete_Location_Data(self):
        """ 
        Function Name: Delete_Location_Data
        Function Description: This function removes all the objects in the Location class
        """    
        del Location.aintLocationID
        del Location.astrLocationDesc        
                        
                        
class Facility(States):
    """
    Class Name: Facility
    Class Description: This class gets and sets the Facility. Pass in the States attributes
    StateID
    """
    # Create class variable shared amongst all Facility methods
    aintFacilityID = []
    astrFacilityName = []   
    
    # Instantiate the following attributes
    def __init__(self, intFacilityID, strFacilityName, strAddress, intStateID, strZip, strPhoneNum):
        # Inherits the child class with all the necessary objects
        super().__init__(intStateID)
        self.intFacilityID = intFacilityID
        self.strFacilityName = strFacilityName
        self.strAddress = strAddress
        self.strZip = strZip
        self.strPhoneNum = strPhoneNum
        
    # Property decorator object get function to access private intFacilityID
    @property
    def intFacilityID(self):
        return self._intFacilityID

    # Property decorator object get function to access private strFacilityName
    @property
    def strFacilityName(self):
        return self._strFacilityName

    # Property decorator object get function to access private strAddress
    @property
    def strAddress(self):
        return self._strAddress

    # Property decorator object get function to access private strZip
    @property
    def strZip(self):
        return self._strZip            

    # Property decorator object get function to access private strPhoneNum
    @property
    def strPhoneNum(self):
        return self._strPhoneNum
            
    # setter method 
    @intFacilityID.setter 
    def intFacilityID(self, intFacilityID): 
        # Return true if specified object is of int type
        if not isinstance(intFacilityID, int): 
            raise TypeError('ID must be an integer') 
        # Check if the value is less than zero, otherwise return true and set the ID to value
        if intFacilityID < 0: 
            raise ValueError('ID cannot be negative') 

        self._intFacilityID = intFacilityID    
        
    # setter method 
    @strFacilityName.setter 
    def strFacilityName(self, strFacilityName): 
        # Return true if specified object is of str type
        if not isinstance(strFacilityName, str): 
            raise TypeError('Facility Name must be a string') 
        # Check if the value is empty, otherwise check if the value is alpha 
        if strFacilityName.isspace(): 
            raise ValueError('Facility Name cannot be empty') 
        # Set the attribute to the value if true
        elif strFacilityName.isalpha():
            self._strHousingDesc = strFacilityName
            
    # setter method 
    @strAddress.setter 
    def strAddress(self, strAddress): 
        # Return true if specified object is of str type
        if not isinstance(strAddress, str): 
            raise TypeError('Address must be a string') 
        # Check if the value is empty, otherwise check if the value is alpha numeric
        if strAddress.isspace(): 
            raise ValueError('Address cannot be empty') 
        # Set the attribute to the value if true
        elif strAddress.isalnum():
            self._strAddress = strAddress
            
    # setter method 
    @strZip.setter 
    def strZip(self, strZip): 
        # Return true if specified object is of str type
        if not isinstance(strZip, str): 
            raise TypeError('Zip Code must be a string') 
        # Check if the value is empty, otherwise check if the value is alpha numeric
        if strZip.isspace(): 
            raise ValueError('Zip Code cannot be empty') 
        # Set the attribute to the value if true
        elif strZip.isalnum():
            self._strZip = strZip
            
    def Append_FacilityIDList(self, intObject):
        """ 
        Function Name: Append_FacilityIDList
        Function Description: This function appends objects to the Facility ID list
        """    
        self.aintFacilityID.append(intObject)

    def Remove_FacilityIDList(self, intObject):
        """ 
        Function Name: Remove_FacilityIDList
        Function Description: This function removes objects in the Facility ID list
        """    
        self.aintFacilityID.remove(intObject)

    def Get_FacilityIDList_Obj(self):
        """ 
        Function Name: Get_FacilityIDList_Obj
        Function Description: This function gets all the objects in the Facility ID list
        """    
        return self.aintFacilityID                                                                    

    def Append_FacilityNameList(self, strObject):
        """ 
        Function Name: Append_FacilityNameList
        Function Description: This function appends objects to the Facility Name list
        """    
        self.astrFacilityName.append(strObject)

    def Remove_FacilityNameList(self, strObject):
        """ 
        Function Name: Remove_FacilityNameList
        Function Description: This function removes objects in the Facility Name list
        """    
        self.astrFacilityName.remove(strObject)

    def Get_FacilityNameList_Obj(self):
        """ 
        Function Name: Get_FacilityNameList_Obj
        Function Description: This function gets all the objects in the Facility Name list
        """    
        return self.astrFacilityName  

    def Get_Facility_Data(self):
        """ 
        Function Name: Get_Facility_Data
        Function Description: This function gets all the objects in the Facility Table
        """            
        # Create the sql query string
        sqlQuery = """SELECT * FROM TFacilities"""
        
        # Get the query results
        QueryResultList = SQLQueries.Load_AllData_Query(sqlQuery)
    
        # Append the Facility Data List
        for i in range(len(QueryResultList)):
            Facility.Append_FacilityIDList(self, QueryResultList[i][0])
            Facility.Append_FacilityNameList(self, QueryResultList[i][1]) 
            
    def Delete_Facility_Data(self):
        """ 
        Function Name: Delete_Facility_Data
        Function Description: This function removes all the objects in the Facility class
        """    
        del Facility.aintFacilityID
        del Facility.astrFacilityName
                    
                
class FireEx(Case):
    """
    Class Name: FireEx
    Class Description: This class is get and set all of the Fire Extinguisher attributes. 
    """
    # Create class variable shared amongst all FireEx methods
    aintFireExID = []
    astrSerialNum = [] 
    adtmManufactureDate = []
    adtmServiceDate = []
    adtmReserviceDate = []
    adtmInstallationDate = []
    adtmLastInspectionDate = []
    adtmNextInspectionDate = []
    ablnDeviceInUseStatus = []
    
    # Instantiate the following attributes
    def __init__(self, intFireExID, strSerialNum, dtmManufactureDate, dtmServiceDate,
                 dtmReserviceDate, dtmInstallationDate, dtmLastInspectionDate, dtmNextInspectionDate,
                 blnDeviceInUse):
        self.intFireExID = intFireExID
        self.strSerialNum = strSerialNum
        self.dtmManufactureDate = dtmManufactureDate
        self.dtmServiceDate = dtmServiceDate
        self.dtmReserviceDate = dtmReserviceDate
        self.dtmInstallationDate = dtmInstallationDate
        self.dtmLastInspectionDate = dtmLastInspectionDate
        self.dtmNextInspectionDate = dtmNextInspectionDate
        self.blnDeviceInUse = blnDeviceInUse
        
    # Property decorator object get function to access private intFireExID
    @property
    def intFireExID(self):
        return self._intFireExID

    # Property decorator object get function to access private strDeviceName
    @property
    def strDeviceName(self):
        return self._strDeviceName

    # Property decorator object get function to access private strSerialNum
    @property
    def strSerialNum(self):
        return self._strSerialNum

    # Property decorator object get function to access private dtmManufactureDate
    @property
    def dtmManufactureDate(self):
        return self._dtmManufactureDate

    # Property decorator object get function to access private dtmServiceDate
    @property
    def dtmServiceDate(self):
        return self._dtmServiceDate

    # Property decorator object get function to access private dtmReserviceDate
    @property
    def dtmReserviceDate(self):
        return self._dtmReserviceDate

    # Property decorator object get function to access private dtmInstallationDate
    @property
    def dtmInstallationDate(self):
        return self._dtmInstallationDate

    # Property decorator object get function to access private dtmLastInspectionDate
    @property
    def dtmLastInspectionDate(self):
        return self._dtmLastInspectionDate

    # Property decorator object get function to access private dtmNextInspectionDate
    @property
    def dtmNextInspectionDate(self):
        return self._dtmNextInspectionDate

    # Property decorator object get function to access private blnDeviceInUse
    @property
    def blnDeviceInUse(self):
        return self._blnDeviceInUse   

    # setter method 
    @intFireExID.setter 
    def intFireExID(self, intFireExID): 
        # Return true if specified object is of int type
        if not isinstance(intFireExID, int): 
            raise TypeError('ID must be an integer') 
        # Check if the value is less than zero, otherwise return true and set the ID to value
        if intFireExID < 0: 
            raise ValueError('ID cannot be negative') 

        self._intFireExID = intFireExID    

    # setter method 
    @strSerialNum.setter 
    def strSerialNum(self, strSerialNum): 
        # Return true if specified object is of str type
        if not isinstance(strSerialNum, str): 
            raise TypeError('Serial Number must be a string') 
        # Check if the value is empty, otherwise check if the value is alpha numeric
        if strSerialNum.isspace(): 
            raise ValueError('Serial Number cannot be empty') 
        # Set the attribute to the value if true
        if strSerialNum.isalnum():
            self._strSerialNum = strSerialNum                

    # setter method 
    @dtmManufactureDate.setter 
    def dtmManufactureDate(self, dtmManufactureDate): 
        # Return true if specified object is of str type
        if not isinstance(dtmManufactureDate, str): 
            raise TypeError('Manufacture Date must first be a string') 
        # Check if the value is empty, otherwise check if the value is date type
        if dtmManufactureDate.isspace(): 
            raise ValueError('Manufacture Date cannot be empty')       
        # Convert the date to string
        dtmManufactureDate = datetime.strptime(dtmManufactureDate, '%m/%d/%Y').date()
        # Return true if specified object is of date type
        if not isinstance(dtmManufactureDate, date): 
            raise TypeError('Manufacture Date must be a valid date') 
        # Convert the date back to string
        dtmManufactureDate = str(dtmManufactureDate)

        self._dtmManufactureDate = dtmManufactureDate                 

    # setter method 
    @dtmServiceDate.setter 
    def dtmServiceDate(self, dtmServiceDate): 
        # Return true if specified object is of str type
        if not isinstance(dtmServiceDate, str): 
            raise TypeError('Service Date must first be a string') 
        # Check if the value is empty, otherwise check if the value is date type
        if dtmServiceDate.isspace(): 
            raise ValueError('Service Date cannot be empty')       
        # Convert the date to string
        dtmServiceDate = datetime.strptime(dtmServiceDate, '%m/%d/%Y').date()
        # Return true if specified object is of date type
        if not isinstance(dtmServiceDate, date): 
            raise TypeError('Service Date must be a valid date') 
        # Convert the date back to string
        dtmServiceDate = str(dtmServiceDate)

        self._dtmServiceDate = dtmServiceDate   
        
    # setter method 
    @dtmReserviceDate.setter 
    def dtmReserviceDate(self, dtmReserviceDate): 
        # Return true if specified object is of str type
        if not isinstance(dtmReserviceDate, str): 
            raise TypeError('Re-service Date must first be a string') 
        # Check if the value is empty, otherwise check if the value is date type
        if dtmReserviceDate.isspace(): 
            raise ValueError('Re-service Date cannot be empty')       
        # Convert the date to string
        dtmReserviceDate = datetime.strptime(dtmReserviceDate, '%m/%d/%Y').date()
        # Return true if specified object is of date type
        if not isinstance(dtmReserviceDate, date): 
            raise TypeError('Re-service Date must be a valid date') 
        # Convert the date back to string
        dtmReserviceDate = str(dtmReserviceDate)

        self._dtmReserviceDate= dtmReserviceDate   
        
    # setter method 
    @dtmInstallationDate.setter 
    def dtmInstallationDate(self, dtmInstallationDate): 
        # Return true if specified object is of str type
        if not isinstance(dtmInstallationDate, str): 
            raise TypeError('Install Date must first be a string') 
        # Check if the value is empty, otherwise check if the value is date type
        if dtmInstallationDate.isspace(): 
            raise ValueError('Install Date cannot be empty')       
        # Convert the date to string
        dtmInstallationDate = datetime.strptime(dtmInstallationDate, '%m/%d/%Y').date()
        # Return true if specified object is of date type
        if not isinstance(dtmInstallationDate, date): 
            raise TypeError('Install Date must be a valid date') 
        # Convert the date back to string
        dtmInstallationDate = str(dtmInstallationDate)

        self._dtmInstallationDate = dtmInstallationDate   
        
    # setter method 
    @dtmLastInspectionDate.setter 
    def dtmLastInspectionDate(self, dtmLastInspectionDate): 
        # Return true if specified object is of str type
        if not isinstance(dtmLastInspectionDate, str): 
            raise TypeError('Last Inspection Date must first be a string') 
        # Check if the value is empty, otherwise check if the value is date type
        if dtmLastInspectionDate.isspace(): 
            raise ValueError('Last Inspection Date cannot be empty')       
        # Convert the date to string
        dtmLastInspectionDate = datetime.strptime(dtmLastInspectionDate, '%m/%d/%Y').date()
        # Return true if specified object is of date type
        if not isinstance(dtmLastInspectionDate, date): 
            raise TypeError('Last Inspection Date must be a valid date') 
        # Convert the date back to string
        dtmLastInspectionDate = str(dtmLastInspectionDate)

        self._dtmLastInspectionDate = dtmLastInspectionDate   

    # setter method 
    @dtmNextInspectionDate.setter 
    def dtmNextInspectionDate(self, dtmNextInspectionDate): 
        # Return true if specified object is of str type
        if not isinstance(dtmNextInspectionDate, str): 
            raise TypeError('Next Inspection Date must first be a string') 
        # Check if the value is empty, otherwise check if the value is date type
        if dtmNextInspectionDate.isspace(): 
            raise ValueError('Next Inspection Date cannot be empty')       
        # Convert the date to string
        dtmNextInspectionDate = datetime.strptime(dtmNextInspectionDate, '%m/%d/%Y').date()
        # Return true if specified object is of date type
        if not isinstance(dtmNextInspectionDate, date): 
            raise TypeError('Next Inspection Date must be a valid date') 
        # Convert the date back to string
        dtmNextInspectionDate = str(dtmNextInspectionDate)

        self._dtmNextInspectionDate = dtmNextInspectionDate   
                
    # setter method 
    @blnDeviceInUse.setter 
    def blnDeviceInUse(self, blnDeviceInUse): 
        # Return true if specified object is of str type
        if not isinstance(blnDeviceInUse, str): 
            raise TypeError('In Use Status must be a string') 
        # Check if the value is empty, otherwise check if the value is alpha 
        if blnDeviceInUse.isspace(): 
            raise ValueError('In Use Status cannot be empty') 
        # Set the attribute to the value if true
        elif blnDeviceInUse.isalpha():
            self._blnDeviceInUse = blnDeviceInUse   
                            
    def Append_FireExIDList(self, intObject):
        """ 
        Function Name: Append_FireExIDList
        Function Description: This function appends objects to the Fire Extinguisher ID list
        """    
        self.aintFireExID.append(intObject)

    def Remove_FireExIDList(self, intObject):
        """ 
        Function Name: Remove_FireExIDList
        Function Description: This function removes objects in the Fire Extinguisher ID list
        """    
        self.aintFireExID.remove(intObject)

    def Get_FireExIDList_Obj(self):
        """ 
        Function Name: Get_FireExIDList_Obj
        Function Description: This function gets all the objects in the Fire Extinguisher ID list
        """    
        return self.aintFireExID               

    def Append_FireExSerialNumList(self, strObject):
        """ 
        Function Name: Append_FireExSerialNumList
        Function Description: This function appends objects to the Fire Ex Serial Number list
        """    
        self.astrSerialNum.append(strObject)

    def Remove_FireExSerialNumList(self, strObject):
        """ 
        Function Name: Remove_FireExSerialNumList
        Function Description: This function removes objects in the Fire Ex Serial Number list
        """    
        self.astrSerialNum.remove(strObject)

    def Get_FireExSerialNumList_Obj(self):
        """ 
        Function Name: Get_FireExSerialNumList_Obj
        Function Description: This function gets all the objects in the Fire Ex Serial Number list
        """    
        return self.astrSerialNum  

    def Append_ManuFactDateList(self, strObject):
        """ 
        Function Name: Append_ManuFactDateList
        Function Description: This function appends objects to the Fire Ex Manufacture Date list
        """    
        self.adtmManufactureDate.append(strObject)

    def Remove_ManuFactDateList(self, strObject):
        """ 
        Function Name: Remove_ManuFactDateList
        Function Description: This function removes objects in the Fire Ex Manufacture Date list
        """    
        self.adtmManufactureDate.remove(strObject)

    def Get_ManuFactDateList_Obj(self):
        """ 
        Function Name: Get_ManuFactDateList_Obj
        Function Description: This function gets all the objects in the Fire Ex Manufacture Date list
        """    
        return self.adtmManufactureDate  

    def Append_ServiceDateList(self, strObject):
        """ 
        Function Name: Append_ServiceDateList
        Function Description: This function appends objects to the Fire Ex Service Date list
        """    
        self.adtmServiceDate.append(strObject)

    def Remove_ServiceDateList(self, strObject):
        """ 
        Function Name: Remove_ServiceDateList
        Function Description: This function removes objects in the Fire Ex Service Date list
        """    
        self.adtmServiceDate.remove(strObject)

    def Get_ServiceDateList_Obj(self):
        """ 
        Function Name: Get_ServiceDateList_Obj
        Function Description: This function gets all the objects in the Fire Ex Service Date list
        """    
        return self.adtmServiceDate  

    def Append_ReserviceDateList(self, strObject):
        """ 
        Function Name: Append_ReserviceDateList
        Function Description: This function appends objects to the Fire Ex Reservice Date list
        """    
        self.adtmReserviceDate.append(strObject)

    def Remove_ReserviceDateList(self, strObject):
        """ 
        Function Name: Remove_ReserviceDateList
        Function Description: This function removes objects in the Fire Ex Reservice Date list
        """    
        self.adtmReserviceDate.remove(strObject)

    def Get_ReserviceDateList_Obj(self):
        """ 
        Function Name: Get_ReserviceDateList_Obj
        Function Description: This function gets all the objects in the Fire Ex Reservice Date list
        """    
        return self.adtmReserviceDate  

    def Append_InstallDateList(self, strObject):
        """ 
        Function Name: Append_InstallDateList
        Function Description: This function appends objects to the Fire Ex Install Date list
        """    
        self.adtmInstallationDate.append(strObject)

    def Remove_InstallDateList(self, strObject):
        """ 
        Function Name: Remove_InstallDateList
        Function Description: This function removes objects in the Fire Ex Install Date list
        """    
        self.adtmInstallationDate.remove(strObject)

    def Get_InstallDateList_Obj(self):
        """ 
        Function Name: Get_InstallDateList_Obj
        Function Description: This function gets all the objects in the Fire Ex Install Date list
        """    
        return self.adtmInstallationDate  

    def Append_NextInspectDateList(self, strObject):
        """ 
        Function Name: Append_NextInspectDateList
        Function Description: This function appends objects to the Fire Ex Next Inspection Date list
        """    
        self.adtmNextInspectionDate.append(strObject)

    def Remove_NextInspectDateList(self, strObject):
        """ 
        Function Name: Remove_NextInspectDateList
        Function Description: This function removes objects in the Fire Ex Next Inspection Date list
        """    
        self.adtmNextInspectionDate.remove(strObject)

    def Get_NextInspectDateList_Obj(self):
        """ 
        Function Name: Get_NextInspectDateList_Obj
        Function Description: This function gets all the objects in the Fire Ex Next Inspection Date list
        """    
        return self.adtmNextInspectionDate  

    def Append_LastInspectDateList(self, strObject):
        """ 
        Function Name: Append_LastInspectDateList
        Function Description: This function appends objects to the Fire Ex Last Inspection Date list
        """    
        self.adtmLastInspectionDate.append(strObject)

    def Remove_LastInspectDateList(self, strObject):
        """ 
        Function Name: Remove_LastInspectDateList
        Function Description: This function removes objects in the Fire Ex Last Inspection Date list
        """    
        self.adtmLastInspectionDate.remove(strObject)

    def Get_LastInspectDateList_Obj(self):
        """ 
        Function Name: Get_LastInspectDateList_Obj
        Function Description: This function gets all the objects in the Fire Ex Last Inspection Date list
        """    
        return self.adtmLastInspectionDate          

    def Append_InUseStatusList(self, strObject):
        """ 
        Function Name: Append_InUseStatusList
        Function Description: This function appends objects to the Fire Ex In Use Status list
        """    
        self.ablnDeviceInUseStatus.append(strObject)

    def Remove_InUseStatusListt(self, strObject):
        """ 
        Function Name: Remove_InUseStatusListt
        Function Description: This function removes objects in the Fire Ex In Use Status list
        """    
        self.ablnDeviceInUseStatus.remove(strObject)

    def Get_InUseStatusList_Obj(self):
        """ 
        Function Name: Get_InUseStatusList_Obj
        Function Description: This function gets all the objects in the Fire Ex In Use Status list
        """    
        return self.ablnDeviceInUseStatus 
    
    def Get_FireEx_Data(self):
        """ 
        Function Name: Get_FireEx_Data
        Function Description: This function gets all the objects in the FireEx table
        """    
        # Create the sql query string
        sqlQuery = """SELECT * FROM TFireEx"""
        
        # Get the query results
        QueryResultList = SQLQueries.Load_AllData_Query(sqlQuery)
    
        # Append the Hose Data List
        for i in range(len(QueryResultList)):
            FireEx.Append_FireExIDList(self, QueryResultList[i][0])
            FireEx.Append_FireExSerialNumList(self, QueryResultList[i][2]) 
            FireEx.Append_ManuFactDateList(self, QueryResultList[i][3]) 
            FireEx.Append_ServiceDateList(self, QueryResultList[i][4]) 
            FireEx.Append_ReserviceDateList(self, QueryResultList[i][5]) 
            FireEx.Append_InstallDateList(self, QueryResultList[i][6]) 
            FireEx.Append_NextInspectDateList(self, QueryResultList[i][7]) 
            FireEx.Append_LastInspectDateList(self, QueryResultList[i][8]) 
            FireEx.Append_InUseStatusList(self, QueryResultList[i][9]) 

    def Add_NewFireEx_Query(self):
        """ 
        Function Name: Add_NewFireEx_Query
        Function Description: This function updates the database with all of the new FireEx objects executing
        the stored procedure uspAddNewFireEx
        """    
        c = Case.intCaseID
        # Create the sql query string
        sqlQuery = """EXEC uspAddNewFireEx @intFireExID=?, 
                                           @intCaseID=?, 
                                           @strSerialNum=?,
                                           @dtmManufactureDate=?,
                                           @dtmServiceDate=?,
                                           @dtmReserviceDate=?,
                                           @dtmInstallationDate=?,
                                           @dtmLastInspectionDate=?,
                                           @dtmNextInspectionDate=?,
                                           @blnDeviceInUse=?
                                           """
        sqlQueryObjects = (0, c, self.strSerialNum, 
                            self.dtmManufactureDate,
                            self.dtmServiceDate,
                            self.dtmReserviceDate, 
                            self.dtmInstallationDate,
                            self.dtmLastInspectionDate,
                            self.dtmNextInspectionDate,
                            self.blnDeviceInUse)                                           

        # Execute the stored procedure
        SQLQueries.Exe_StoredProDates_Query(sqlQuery, sqlQueryObjects)  
                                
    def Delete_FireEx_Data(self):
        """ 
        Function Name: Delete_FireEx_Data
        Function Description: This function removes all the objects in the FireEx class
        """    
        del FireEx.aintFireExID
        del FireEx.astrSerialNum
        del FireEx.adtmManufactureDate
        del FireEx.adtmServiceDate
        del FireEx.adtmReserviceDate
        del FireEx.adtmInstallationDate
        del FireEx.adtmLastInspectionDate
        del FireEx.adtmNextInspectionDate
        del FireEx.ablnDeviceInUseStatus
        
                                                                                                                                          
class StandardInspect(StandardHoseInspect, StandardHandelInspect, StandardPressGuageInspect, StandardCaseInspect,
                      StandardHouseInspect):
    """
    Class Name: StandardInspect
    Class Description: This class gets and sets all of the Standard Inspection attributes for classes:
    StandardHoseInspect, StandardHandelInspect, StandardPressGuageInspect, StandardCaseInspect, StandardHouseInspect
    """
    # Create class variable shared amongst all Standard Inspection  methods
    aintStandardInspectionID = []
        
    # Instantiate the following attributes
    def __init__(self, intStandardInspectionID, intStandardHoseInspectionID, intStandardHandleInspectionID, 
            intStandardPressGuageInspectionID, intStandardCaseInspectionID, intStandardHousingInspectionID):
        # Inherits the child class with all the necessary objects
        super().__init__(intStandardHoseInspectionID, intStandardHandleInspectionID, 
            intStandardPressGuageInspectionID, intStandardCaseInspectionID, intStandardHousingInspectionID)
        self.intStandardInspectionID = intStandardInspectionID

    # Property decorator object get function to access private intStandardInspectionID
    @property
    def intStandardInspectionID(self):
        return self._intStandardInspectionID
    
    # setter method 
    @intStandardInspectionID.setter 
    def intStandardInspectionID(self, intStandardInspectionID): 
        # Return true if specified object is of int type
        if not isinstance(intStandardInspectionID, int): 
            raise TypeError('ID must be an integer') 
        # Check if the value is less than zero, otherwise return true and set the ID to value
        if intStandardInspectionID < 0: 
            raise ValueError('ID cannot be negative') 

        self._intStandardInspectionID = intStandardInspectionID    
        
    def Append_StandInspectIDList(self, intObject):
        """ 
        Function Name: Append_StandInspectIDList
        Function Description: This function appends objects to the Standard Inpsction ID list
        """    
        self._aintStandardInspectionID.append(intObject)

    def Remove_StandInspectIDList(self, intObject):
        """ 
        Function Name: Remove_StandInspectIDList
        Function Description: This function removes objects in the Standard Inpsction ID list
        """    
        self._aintStandardInspectionID.remove(intObject)

    def Get_StandInspectIDList_Obj(self):
        """ 
        Function Name: Get_StandInspectIDList_Obj
        Function Description: This function gets all the objects in the Standard Inpsction ID list
        """    
        return self._aintStandardInspectionID               
                
    def Add_StandardInspect_Query(self):
        """ 
        Function Name: Add_StandardInspect_Query
        Function Description: This function updated the database with all of the necessary objects executing
        the stored procedure uspAddNewStandardInspection
        """    
        # Create the sql query string
        sqlQuery = """EXEC uspAddNewStandardInspection @intStandardInspectionID=%d, 
                                                       @intStandardHoseInspectionID=%d, 
                                                       @intStandardHandleInspectionID=%d,
                                                       @intStandardPressGuageInspectionID=%d,
                                                       @intStandardCaseInspectionID=%d,
                                                       @intStandardHousingInspectionID=%d
                                                       """%(0, self.intStandardHoseInspectionID[0], self.intStandardHandleInspectionID[0],
                                                            self.intStandardPressGuagueInspectionID[0], self.intStandardCaseInspectionID[0],
                                                            self.intStandardHousingInspectionID[0])

        # Execute the stored procedure
        SQLQueries.Exe_StoredPro_Query(sqlQuery)                
                  
    def Get_MaxStandardInspectID(self):
        """ 
        Function Name: Get_MaxStandardInspectID
        Function Description: This function gets the max ID inside the TStandardInspections table
        """    
        # Create the sql query string
        sqlQuery = """SELECT MAX(intStandardInspectionID) FROM TStandardInspections"""
        QueryID = int(0)

        # Execute the query
        self.intStandardInspectionID = SQLQueries.Get_SingleValue_Query(sqlQuery, QueryID)

    def Delete_StandInspection_Data(self):
        """ 
        Function Name: Delete_StandInspection_Data
        Function Description: This function removes all the objects in the Standard Inspection class
        """    
        del StandardInspect.aintStandardInspectionID
                
                                    
class FireExInspect(FireEx, Location, StandardInspect, Inspector, Facility):
    """
    Class Name: FireExInspect
    Class Description: This class gets and sets all of the Fire Extinguisher Inspection attributes. 
    """
    # Create class variable shared amongst all Fire Inspection methods
    aintFireExInspectionID = []
        
    # Instantiate the following attributes
    def __init__(self, intFireExInspectionID, intFireExID, intLocationID, intFacilityID, intStandardInspectionID, 
                 intInspectorID, dtmLastInspectionDate, dtmNextInspectionDate):
        # Inherits the child class with all the necessary objects
        super().__init__(intFireExID, intLocationID, intFacilityID, intStandardInspectionID, intInspectorID, 
                 dtmLastInspectionDate, dtmNextInspectionDate)
        self.intFireExInspectionID = intFireExInspectionID

    # Property decorator object get function to access private intFireExInspectionID
    @property
    def intFireExInspectionID(self):
        return self._intFireExInspectionID
        
    # setter method 
    @intFireExInspectionID.setter 
    def intFireExInspectionID(self, intFireExInspectionID): 
        # Return true if specified object is of int type
        if not isinstance(intFireExInspectionID, int): 
            raise TypeError('ID must be an integer') 
        # Check if the value is less than zero, otherwise return true and set the ID to value
        if intFireExInspectionID < 0: 
            raise ValueError('ID cannot be negative') 

        self._intFireExInspectionID = intFireExInspectionID    

    def Append_FireExInspectIDList(self, intObject):
        """ 
        Function Name: Append_FireExInspectIDList
        Function Description: This function appends objects to the FireEx Inspection ID list
        """    
        self.aintFireExInspectionID.append(intObject)

    def Remove_FireExInspectIDList(self, intObject):
        """ 
        Function Name: Remove_FireExInspectIDList
        Function Description: This function removes objects in the FireEx Inspection ID list
        """    
        self.aintFireExInspectionID.remove(intObject)

    def Get_FireExInspectIDList_Obj(self):
        """ 
        Function Name: Get_FireExInspectIDList_Obj
        Function Description: This function gets all the objects in the FireEx Inspection ID list
        """    
        return self.aintFireExInspectionID   
            
    def Add_FireExInspection_Query(self):
        """ 
        Function Name: Add_FireExInspection_Query
        Function Description: This function updated the database with all of the necessary objects executing
        the stored procedure uspAddNewFireExInspection
        """    
        i = Inspector.intInspectorID
        
        # Create the sql query string
        sqlQuery = """EXEC uspAddNewFireExInspection @intFireExInspectionID=%d, 
                                                       @intFireExID=%d, 
                                                       @intLocationID=%d,
                                                       @intStandardInspectionID=%d,
                                                       @intInspectorID=%d
                                                       """%(0, self.intFireExID, self.intLocationID, 
                                                            self.intStandardInspectionID[0], i) 

        # Execute the stored procedure
        SQLQueries.Exe_StoredPro_Query(sqlQuery)         
        
    def Add_FireExInspector_Query(self):
        """ 
        Function Name: Add_FireExInspector_Query
        Function Description: This function updated the database with all of the necessary objects executing
        the stored procedure uspAddNewFireExInspector
        """    
        i = Inspector.intInspectorID
        
        # Create the sql query string
        sqlQuery = """EXEC uspAddNewFireExInspector @intFireExInspectorID=%d,
                                                    @intFireExID=%d, 
                                                    @intInspectorID=%d
                                                    """%(0, self.intFireExID, i) 

        # Execute the stored procedure
        SQLQueries.Exe_StoredPro_Query(sqlQuery)            
        
    def Add_FireExLocation_Query(self):
        """ 
        Function Name: Add_FireExLocation_Query
        Function Description: This function updated the database with all of the necessary objects executing
        the stored procedure uspAddNewFireExLocation
        """    
        # Create the sql query string
        sqlQuery = """EXEC uspAddNewFireExLocation @intFireExLocationID=%d,
                                                   @intLocationID=%d, 
                                                   @intFireExID=%d
                                                    """%(0, self.intLocationID, self.intFireExID) 

        # Execute the stored procedure
        SQLQueries.Exe_StoredPro_Query(sqlQuery)           
        
    def Add_FireExFacilityLocation_Query(self):
        """ 
        Function Name: Add_FireExFacilityLocation_Query
        Function Description: This function updated the database with all of the necessary objects executing
        the stored procedure uspAddNewFireExFacilityLocation
        """    
        # Create the sql query string
        sqlQuery = """EXEC uspAddNewFireExFacilityLocation @intFireExFacilityLocationID=%d,
                                                           @intFacilityID=%d,
                                                           @intLocationID=%d, 
                                                           @intFireExID=%d
                                                           """%(0, self.intFacilityID, self.intLocationID, self.intFireExID) 

        # Execute the stored procedure
        SQLQueries.Exe_StoredPro_Query(sqlQuery)        
                     