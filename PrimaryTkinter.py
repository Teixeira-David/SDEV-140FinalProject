# ----------------------------------------------------------------------------------------------------
# Project Name: Fire Extinguisher Inspection (Final Project)
# Developer: David Teixeira
# Date: 02/22/2023
# Abstract: This module contains the tkinter, and main program classes. 
# ----------------------------------------------------------------------------------------------------

# Import Python Libraries
# import os
# import re
# import hashlib
# import maskpass
# from pyisemail import is_email
from datetime import datetime, timedelta, date
# from dateutil.relativedelta import relativedelta
# import subprocess
# import sys
# import pandas as pd
# from pandas import ExcelWriter
from tkinter import *
from tkinter import messagebox, ttk
from PIL import ImageTk, Image

# Import project modules
from ObjectClass import LoginName, InspectionStatus, Hose, PressGuage, Handle
from ObjectClass import Housing, States, Facility, FireEx, Location, Case
from ObjectClass import StandardHoseInspect, StandardHandelInspect, StandardCaseInspect, StandardHouseInspect
from ObjectClass import StandardPressGuageInspect, StandardInspect, FireExInspect, Inspector
from QueryClass import SQLQueries, BaseFunctions 


class UserLogin_Main():
    """
    Class Name: UserLogin_Main
    Class Description: This class is the main start up of the program where the user logs into the program.
    """
    
    def __init__(self):
        """ 
        Function Name: __init__
        Function Purpose: Instanciate the class objects and attributes for the Tkinter GUI
        """
        # Create the root tkinter variable
        self.root = Tk()
        
        # Create the Window attributes
        self.WindowTitle = self.root.title("Login Page")
        self.WindowGeo = self.root.geometry("535x130")
        self.WindowSize = self.root.resizable(False, False)
        
        # Create the frame for the image
        self.ImageFrame = LabelFrame(self.root, text='')
        self.ImageFrame.grid(row=0, column=0, padx=10)
        
        # Get the image from the project file
        self.InspectorImage = Image.open("FireExIcon.GIF")
        self.width, self.height = self.InspectorImage.size
        
        # Create the canvas that fits the image
        self.canvas = Canvas(self.ImageFrame, width=self.width, height=self.height)
        self.canvas.grid(row=0, column=0)
        
        # Use pillow to convert the photo
        self.photo = ImageTk.PhotoImage(self.InspectorImage)
        
        # Add the image to the canvas
        self.canvas.create_image(0, 0, image=self.photo, anchor=NW)
        
        # Create the frame for the login credentials
        self.logFrame = LabelFrame(self.root, text="Login Requirements")
        self.logFrame.grid(row=0, column=1, padx=10)
        
        # Create the Label attributes
        self.LoginLabel = Label(self.logFrame, text="Login Name")
        self.PasswordLabel = Label(self.logFrame, text="Password")
        self.LoginLabel.grid(row=0, column=0)
        self.PasswordLabel.grid(row=1, column=0)
        
        # Create the Login Credential attributes
        self.LoginNameEntry = StringVar()
        self.LoginPasswordEntry = StringVar()
        self.LoginNameEntry = Entry(self.logFrame, width = 33)
        self.LoginPasswordEntry =  Entry(self.logFrame, width = 33, show='*') 
        self.LoginNameEntry.grid(row=0, column=1, columnspan=3, pady=5)
        self.LoginPasswordEntry.grid(row=1, column=1, columnspan=3)
        self.LoginNameEntry.focus()

        # Create the Button attributes
        self.SubmitButton = Button(self.logFrame, text = "Submit", width=5, command=lambda:UserLogin_Main.SubmitButton_Click(self))
        self.ClearButton = Button(self.logFrame, text = "Clear", width=5,  command=lambda:UserLogin_Main.ClearButton_Click(self))
        self.btnExit = Button(self.logFrame, text = "Exit", width=5,  command=lambda:self.root.destroy())
        self.SubmitButton.grid(row=2, column=1)
        self.ClearButton.grid(row=2, column=2)
        self.btnExit.grid(row=2, column=3)
    
        # Keep the root window open while the user is interacting with the widgets
        self.root.mainloop()

    def Get_LoginName(self):
        """ 
        Function Name: Get_LoginName
        Function Purpose: This function executes when the user enters the a Login Name.
        """   
        # Get the user input and pass assign to a local variable
        logName = self.LoginNameEntry.get()
        
        # Check if the user input is empty
        if self.LoginNameEntry.get() != "":
            # Validate the user inputs
            logNameReturnList = SQLQueries.Check_Login_Name(logName)
            # Check if the returning bool is false to notify the user the entry was invalid
            if (logNameReturnList[0] is False):
                messagebox.showwarning(title='ERROR', message='Invalid Input. Please Try again.')
                self.LoginNameEntry.delete(0, END)
                self.LoginNameEntry.configure(background='Yellow')    
            else:              
                # Return the list objects
                return logNameReturnList

        else:
            messagebox.showwarning(title='ERROR', message='Input should not be empty. Please Try again.')
            self.LoginNameEntry.delete(0, END)
            self.LoginNameEntry.configure(background='Yellow')

    def Get_LoginPassword(self):
        """ 
        Function Name: Get_LoginPassword
        Function Purpose: This function executes when the user enters the a Login Password.
        """   
        # Get the user input and pass assign to a local variable
        logPswrd = self.LoginPasswordEntry.get()
        
        # Check if the user input is empty
        if self.LoginPasswordEntry.get() != "":
            # Validate the user inputs
            logPswrdReturnList = BaseFunctions.Validate_Login_Password(logPswrd)
            # Check if the returning bool is false to notify the user the entry was invalid
            if (logPswrdReturnList[0] is False):
                messagebox.showwarning(title='ERROR', message='Invalid Input. Please Try again.')
                self.LoginPasswordEntry.delete(0, END)
                self.LoginPasswordEntry.configure(background='Yellow')            
            else:
                # Return the list objects
                return logPswrdReturnList          
                    
        else:
            messagebox.showwarning(title='ERROR', message='Input should not be empty. Please Try again.')
            self.LoginPasswordEntry.delete(0, END)
            self.LoginPasswordEntry.configure(background='Yellow') 
            
    def SubmitButton_Click(self):
        """ 
        Function Name: SubmitButton_Click
        Function Purpose: This function is executed once the user enters their user name and password
        """
        UserLogin_Main.Clear_BG_Color(self)
        
        # Do while loop until the user enters a valid input
        logNameReturnList = UserLogin_Main.Get_LoginName(self)
        logPswrdReturnList = UserLogin_Main.Get_LoginPassword(self)
        
        # Validate the user inputs
        if (logNameReturnList[0] is True) and (logPswrdReturnList[0] is True):
            # Validate that the elments in the list are equal
            if logNameReturnList[2] == logPswrdReturnList[2]:
                # Assign the class attributes to the valid inputs
                l = LoginName(logNameReturnList[2], logNameReturnList[1], logPswrdReturnList[1]) 
                
                # Get the InspectorID 
                Inspector.intInspectorID = l.intLoginID
                
                # Delete the login name and login password to reset the text box
                self.LoginNameEntry.delete(0, END)
                self.LoginPasswordEntry.delete(0, END)
                
                # Destroy the window and proceed to the main menu
                self.root.destroy()        
                Start_Menu()               
        else:
            UserLogin_Main.ClearButton_Click(self)
            
            
    def ClearButton_Click(self):
        """ 
        Function Name: ClearButton_Click
        Function Purpose: This function is executed if the user clicks clear. The fields should be deleted
        """
        # Delete the login name and login password to reset the text box
        self.LoginNameEntry.delete(0, END)
        self.LoginPasswordEntry.delete(0, END)
        
        # Clear out the background colors and set to default as 'white'
        UserLogin_Main.Clear_BG_Color(self)
        
        # Return focus to first input
        self.LoginNameEntry.focus()
            
    def Clear_BG_Color(self):
        """ 
        Function Name: Clear_BG_Color
        Function Purpose: This button executes when the user submits their entries and clears the background
        color before any validation checks.
        """
        # Delete the button after submission
        self.LoginNameEntry.configure(background='White')
        self.LoginPasswordEntry.configure(background='White')
        
        
class Start_Menu():
    """
    Class Name: Start_Menu
    Class Description: This class is for the main menu after the user validates their login credentials. 
    """
    def __init__(self):
        # Load the data from the database 
        InspectionStatus.Get_InspectionStatus_Data(InspectionStatus)
        Hose.Get_Hose_Data(Hose)
        Handle.Get_Handel_Data(Handle)
        PressGuage.Get_PressGuage_Data(PressGuage)
        Case.Get_Case_Data(Case)
        Housing.Get_Housing_Data(Housing)
        States.Get_State_Data(States)
        Facility.Get_Facility_Data(Facility)
        Location.Get_Location_Data(Location)
        FireEx.Get_FireEx_Data(FireEx)
                
        # Create the root tkinter variable
        self.root = Tk()
        
        # Create the Window attributes
        self.WindowTitle = self.root.title("Main Menu")
        self.WindowGeo = self.root.geometry("410x360")
        self.WindowSize = self.root.resizable(False, False)
        
        # Create the frame for the image
        self.ImageFrame = LabelFrame(self.root, text='Device Unit')
        self.ImageFrame.grid(row=0, column=0, padx=10)
        
        # Get the image from the project file
        self.FireExImage = Image.open("FireEx.GIF")
        self.width, self.height = self.FireExImage.size
        
        # Create the canvas that fits the image
        self.canvas = Canvas(self.ImageFrame, width=self.width, height=self.height)
        self.canvas.grid(row=0, column=0)
        
        # Use pillow to convert the photo
        self.photo = ImageTk.PhotoImage(self.FireExImage)
        
        # Add the image to the canvas
        self.canvas.create_image(0, 0, image=self.photo, anchor=NW)
                
        # Create the frame for the buttons
        self.btnFrame = LabelFrame(self.root, text='Menu Selection')
        self.btnFrame.grid(row=0, column=1)
        
        # Create the Buttons
        self.NewInspectButton = Button(self.btnFrame, width=20, text = "New Inspection", command=lambda:Start_Menu.Open_NewInspection(self))
        self.AddNewUnitButton = Button(self.btnFrame, width=20, text = "Add Unit", command=lambda:Start_Menu.Open_AddUnit(self))
        self.AddNewUserButton = Button(self.btnFrame, width=20, text = "Add User", command=lambda:Open_AddUser, state='disabled')
        self.AddNewFacilityButton = Button(self.btnFrame, width=20, text = "Add Facility", command=lambda:Open_AddFacility, state='disabled')
        self.AddNewLocationButton = Button(self.btnFrame, width=20, text = "Add Location", command=lambda:Open_AddLocation, state='disabled')
        self.ViewFutureInspectDateButton = Button(self.btnFrame, width=20, text = "View Future Inspection Dates", command=lambda:Start_Menu.Open_ViewFuture_InspectDates(self), state='disabled')
        self.ViewUnitInfoButton = Button(self.btnFrame, width=20, text = "View Unit Information", command=lambda:Open_ViewUnit_Info, state='disabled')
        self.ViewInspectResultButton = Button(self.btnFrame, width=20, text = "View Inspection Results", command=lambda:Open_ViewInspect_Results, state='disabled')
        self.UpdateUnitInfoButton = Button(self.btnFrame, width=20, text = "Update Unit Information", command=lambda:Open_UpdateUnit_Info, state='disabled')
        self.DownloadReportButton = Button(self.btnFrame, width=20, text = "Download Report", command=lambda:Open_DownloadReport, state='disabled')
        self.SendReportButton = Button(self.btnFrame, width=20, text = "Send Report", command=lambda:Open_SendReport, state='disabled')
        self.ExitButton = Button(self.btnFrame, width=20, text = "Exit", command=lambda:Start_Menu.Exit(self))

        # Create the button grid
        self.NewInspectButton.grid(row=0, column=1)
        self.AddNewUnitButton.grid(row=1, column=1)
        self.AddNewUserButton.grid(row=2, column=1)
        self.AddNewFacilityButton.grid(row=3, column=1)
        self.AddNewLocationButton.grid(row=4, column=1)
        self.ViewFutureInspectDateButton.grid(row=5, column=1)
        self.ViewUnitInfoButton.grid(row=6, column=1)
        self.ViewInspectResultButton.grid(row=7, column=1)
        self.UpdateUnitInfoButton.grid(row=8, column=1)
        self.DownloadReportButton.grid(row=9, column=1)
        self.SendReportButton.grid(row=10, column=1)
        self.ExitButton.grid(row=11, column=1)

        # Keep the root window open while the user is interacting with the widgets
        self.root.mainloop()
        
    def Open_NewInspection(self):
        """ 
        Function Name: Open_NewInspection
        Function Purpose: This function is executed if the user clicks new inspection button. The 
        call is to the inspection class and will execute and add a new inspection to the database.
        """
        # Delete the root window
        self.root.destroy()
        
        # Open the New Inspection Window
        NewInspection()

        
    def Open_AddUnit(self):
        """ 
        Function Name: Open_AddUnit
        Function Purpose: This function is executed if the user clicks add new unit button. The 
        call is to the fire extinguisher class and will execute and add a new unit to the database.
        """
        # Delete the root window
        self.root.destroy()
        
        # Open the New New Unit Window
        AddUnit()

    
    def Delete_Obj_Lists(self):
        """ 
        Function Name: Delete_Obj_Lists
        Function Purpose: This function is executed if the user clicks submit button. The list objects in each 
        class will be deleted to be reupdated by the call to the db if there is any new inspections or added data
        to the db
        """
        InspectionStatus.Delete_InspectionStatus_Data(self)
        Hose.Delete_Hose_Data(self)
        StandardHoseInspect.Delete_StandHoseInspect_Data(self)
        Handle.Delete_Handle_Data(self)
        StandardHandelInspect.Delete_StandHandleInspect_Data(self)
        PressGuage.Delete_PressGuage_Data(self)
        StandardPressGuageInspect.Delete_StandPressGuageInspect_Data(self)
        Case.Delete_Case_Data(self)
        StandardCaseInspect.Delete_StandCaseInspect_Data(self)
        Housing.Delete_Housing_Data(self)
        StandardHouseInspect.Delete_StandHousingInspect_Data(self)
        States.Delete_State_Data(self)
        Location.Delete_Location_Data(self)
        Facility.Delete_Facility_Data(self)
        FireEx.Delete_FireEx_Data(self)
        StandardInspect.Delete_StandInspection_Data(self)
    
    def Exit(self):
        """ 
        Function Name: Exit
        Function Purpose: This function is executed if the user clicks exit button. The main menu will
        exit once this button is clicked and will return the user to the login page.
        """
        # Delete the root window
        self.root.destroy()
        
        # Create the new window
        UserLogin_Main()
            
            
class NewInspection(Facility, FireEx, Location, Case, PressGuage, Housing, InspectionStatus, Handle, Hose):
    """
    Class Name: NewInspection
    Class Description: This class is to conduct a new inspection for each unit.
    """
    def __init__(self):
        """ 
        Function Name: Instantiate the new window
        Function Purpose: This function is executed if the user conducts a new unit inspection. Display a message
        to the user regarding the protocol for each inspection. User must click 'Check' Button in order to submit
        the data to the db.
        """
        # Create the root tkinter variable
        self.root = Tk()

        # Create the Window attributes                
        self.WindowTitle = self.root.title("New Inspection")
        self.WindowGeo = self.root.geometry("630x700")
        self.WindowSize = self.root.resizable(False, False)
        
        # Create the multi line text field
        self.frameMSG = LabelFrame(self.root, text="Inspection Message")
        self.frameMSG.place(x=5, y=0, width=620)
        
        # Create the display message for the new inspection
        self.DisplayMessage = str(
"""
Please make sure to fill out all of the required fields before submitting the data to 
the database. You will be required to inspect each unit throughly and report all 
findings. Once the data has been submitted, please take caution replacing the unit back
to its original location. If any component requires replacement, please notify the 
manufacturer for the required parts needed. Once you have verified the inspection 
results are correct, please submit the document and send the report to the client. 
""")
        
        # Create the label for the display message
        self.InstructMessage = Label(self.frameMSG, text=self.DisplayMessage)
        self.InstructMessage.grid(row=0, column=0, padx=40, sticky='N')

        # Creat the second frame to hold the selection fields
        self.frameInput = LabelFrame(self.root, text="Unit Components")
        self.frameInput.place(x=5, y=155, width=330, height=285)

        # Create the labes for the drop down menu lists
        self.Facility = Label(self.frameInput, text="Facility:")
        self.SerialNum = Label(self.frameInput, text="Serial Number:")
        self.Location = Label(self.frameInput, text="Unit Location:")
        self.InUse = Label(self.frameInput, text="Device In Use:")
        self.HoseLength = Label(self.frameInput, text="Hose Length:")
        self.HandleType = Label(self.frameInput, text="Handle Type:")
        self.PressGuageType = Label(self.frameInput, text="Pressure Guage Type:")
        self.PressGuageRange = Label(self.frameInput, text="Pressure Guage Range:")
        self.CaseWeight = Label(self.frameInput, text="Case Weight:")
        self.CaseAgent = Label(self.frameInput, text="Case Agent:")
        self.HousingType = Label(self.frameInput, text="Housing Type:")

        # Create the label locations
        self.Facility.grid(row=0, column=0, sticky='W')
        self.SerialNum.grid(row=1, column=0, sticky='W') 
        self.Location.grid(row=2, column=0, sticky='W') 
        self.InUse.grid(row=3, column=0, sticky='W') 
        self.HoseLength.grid(row=4, column=0, sticky='W') 
        self.HandleType.grid(row=5, column=0, sticky='W') 
        self.PressGuageType.grid(row=6, column=0, sticky='W') 
        self.PressGuageRange.grid(row=7, column=0, sticky='W') 
        self.CaseWeight.grid(row=8, column=0, sticky='W')
        self.CaseAgent.grid(row=9, column=0, sticky='W')
        self.HousingType.grid(row=10, column=0, sticky='W') 
        
        # Create the drop down menu list for each attribute
        self.dropFacility = ttk.Combobox(self.frameInput, values=Facility.astrFacilityName, state='readonly')
        self.dropSerialNum = ttk.Combobox(self.frameInput, values=FireEx.astrSerialNum, state='readonly')
        self.dropLocation = ttk.Combobox(self.frameInput, values=Location.astrLocationDesc, state='readonly')
        self.dropInUse = ttk.Combobox(self.frameInput, values=['Yes', 'No'], state='readonly')
        self.dropHose = ttk.Combobox(self.frameInput, values=Hose.astrHoseLength, state='readonly')
        self.dropHandle = ttk.Combobox(self.frameInput, values=Handle.astrHandleType, state='readonly')
        self.dropPressGuageType = ttk.Combobox(self.frameInput, values=PressGuage.astrPressureType, state='readonly')
        self.dropPressGuageRange = ttk.Combobox(self.frameInput, values=PressGuage.astrPressureRange, state='readonly')
        self.dropCaseWeight = ttk.Combobox(self.frameInput, values=Case.astrCaseWeight, state='readonly')
        self.dropCaseAgent = ttk.Combobox(self.frameInput, values=Case.astrCaseAgents, state='readonly')
        self.dropHousing = ttk.Combobox(self.frameInput, values=Housing.astrHousingDesc, state='readonly')
        self.dropStatus = ttk.Combobox(self.frameInput, values=InspectionStatus.astrInspectionStatusDesc, state='readonly')        

        # Create the drop down menu size for each attribute
        self.dropFacility.configure(width=15)
        self.dropSerialNum.configure(width=15)
        self.dropLocation.configure(width=15)
        self.dropInUse.configure(width=15)
        self.dropHose.configure(width=15)
        self.dropHandle.configure(width=15)
        self.dropPressGuageType.configure(width=15)
        self.dropPressGuageRange.configure(width=15)
        self.dropCaseWeight.configure(width=15)
        self.dropCaseAgent.configure(width=15)
        self.dropHousing.configure(width=15)
        self.dropStatus.configure(width=15)
        
        # Create the grid for the drop down menu list objects
        self.dropFacility.grid(row=0, column=1, padx=10)   
        self.dropSerialNum.grid(row=1, column=1, padx=10)
        self.dropLocation.grid(row=2, column=1, padx=10)
        self.dropInUse.grid(row=3, column=1, padx=10)
        self.dropHose.grid(row=4, column=1, padx=10)
        self.dropHandle.grid(row=5, column=1, padx=10)
        self.dropPressGuageType.grid(row=6, column=1, padx=10)
        self.dropPressGuageRange.grid(row=7, column=1, padx=10)
        self.dropCaseWeight.grid(row=8, column=1, padx=10)
        self.dropCaseAgent.grid(row=9, column=1, padx=10)
        self.dropHousing.grid(row=10, column=1, padx=10)
    
        # Create the status frame
        self.statusFrame = LabelFrame(self.root, text="Status Results")
        self.statusFrame.place(x=340, y=155, width=285, height=165)
        
        # Create the labels for the input drop down list in the status frame
        self.HoseLengthStatus = Label(self.statusFrame, text="Hose Status:")
        self.HandleTypeStatus = Label(self.statusFrame, text="Handle Status:")
        self.PressureGuageStatus = Label(self.statusFrame, text="Pressure Guage Status:")
        self.CaseTypeStatus = Label(self.statusFrame, text="Case Type Status:")
        self.HousingTypeStatus = Label(self.statusFrame, text="Housing Type Status:")
                
        # Create the label locations for the status frame
        self.HoseLengthStatus.grid(row=0, column=0, sticky='W') 
        self.HandleTypeStatus.grid(row=1, column=0, sticky='W') 
        self.PressureGuageStatus.grid(row=2, column=0, sticky='W') 
        self.CaseTypeStatus.grid(row=3, column=0, sticky='W')
        self.HousingTypeStatus.grid(row=4, column=0, sticky='W') 

        # # Create the drop down menu click object
        self.optHoseStatus = ttk.Combobox(self.statusFrame, values=InspectionStatus.astrInspectionStatusDesc, state='readonly')
        self.optHandleStatus = ttk.Combobox(self.statusFrame, values=InspectionStatus.astrInspectionStatusDesc, state='readonly')
        self.optPressureStatus = ttk.Combobox(self.statusFrame, values=InspectionStatus.astrInspectionStatusDesc, state='readonly')
        self.optCaseStatus = ttk.Combobox(self.statusFrame, values=InspectionStatus.astrInspectionStatusDesc, state='readonly')
        self.optHousingStatus = ttk.Combobox(self.statusFrame, values=InspectionStatus.astrInspectionStatusDesc, state='readonly')
                
        # Create the drop down menu size for each attribute
        self.optHoseStatus.configure(width=11)
        self.optHandleStatus.configure(width=11)
        self.optPressureStatus.configure(width=11)
        self.optCaseStatus.configure(width=11)
        self.optHousingStatus.configure(width=11)
                
        # Create the grid for the drop down menu list objects
        self.optHoseStatus.grid(row=0, column=1)
        self.optHandleStatus.grid(row=1, column=1)
        self.optPressureStatus.grid(row=2, column=1)
        self.optCaseStatus.grid(row=3, column=1)
        self.optHousingStatus.grid(row=4, column=1)
        
        # Create the check button frame
        self.checkFrame = LabelFrame(self.root, text="Check Inspection Results")
        self.checkFrame.place(x=340, y=320, width=285, height=60)
        
        # Create the buttons
        self.btnCheck = Button(self.checkFrame, text="Check", width=5, command=lambda:NewInspection.Check_Click(self))
        self.btnReset = Button(self.checkFrame, text="Reset", width=5, command=lambda:NewInspection.Reset(self))
        
        # Create the button grid for check frame
        self.btnCheck.grid(row=0, column=0, padx=30, pady=2)
        self.btnReset.grid(row=0, column=1, padx=10, pady=2)

        # Create the result frame
        self.uploadFrame = LabelFrame(self.root, text="Upload Inspection Results")
        self.uploadFrame.place(x=340, y=380, width=285, height=60)
                
        # Create the buttons for the result frame
        self.btnSubmit = Button(self.uploadFrame, text="Submit", width=5, command=lambda:NewInspection.Submit(self), state=DISABLED)
        self.btnExit = Button(self.uploadFrame, text="Exit", width=5, command=lambda:NewInspection.Exit(self))
        
        # Create the grid for the result buttons
        self.btnSubmit.grid(row=0, column=0, padx=30, pady=2)
        self.btnExit.grid(row=0, column=1, padx=10, pady=2) 
                        
        # Create the result frame
        self.resultFrame = LabelFrame(self.root, text="Inspection Results")
        self.resultFrame.place(x=5, y=445, width=620, height=245)
        
        # Create the labes for the result frame
        self.resultFacility = Label(self.resultFrame, text="Facility:")
        self.resultSerialNum = Label(self.resultFrame, text="Serial Number:")
        self.resultLocation = Label(self.resultFrame, text="Unit Location:")
        self.resultInUse = Label(self.resultFrame, text="Device In Use:")
        self.resultHoseLength = Label(self.resultFrame, text="Hose Length:")
        self.resultHandleType = Label(self.resultFrame, text="Handle Type:")
        self.resultPressGuageType = Label(self.resultFrame, text="Pressure Guage Type:")
        self.resultPressGuageRange = Label(self.resultFrame, text="Pressure Guage Range:")
        self.resultCaseWeight = Label(self.resultFrame, text="Case Weight:")
        self.resultCaseAgent = Label(self.resultFrame, text="Case Agent:")
        self.resultHousingType = Label(self.resultFrame, text="Housing Type:")
        self.resultHoseLengthStatus = Label(self.resultFrame, text="Hose Status:")
        self.resultHandleTypeStatus = Label(self.resultFrame, text="Handle Status:")
        self.resultPressureGuageStatus = Label(self.resultFrame, text="Pressure Guage Status:")
        self.resultCaseTypeStatus = Label(self.resultFrame, text="Case Type Status:")
        self.resultHousingTypeStatus = Label(self.resultFrame, text="Housing Type Status:")
        
        # Create the label locations for the result frame 
        self.resultFacility.grid(row=0, column=0, sticky='W')
        self.resultSerialNum.grid(row=1, column=0, sticky='W') 
        self.resultLocation.grid(row=2, column=0, sticky='W') 
        self.resultInUse.grid(row=3, column=0, sticky='W') 
        self.resultHoseLength.grid(row=4, column=0, sticky='W') 
        self.resultHandleType.grid(row=5, column=0, sticky='W') 
        self.resultPressGuageType.grid(row=6, column=0, sticky='W') 
        self.resultPressGuageRange.grid(row=7, column=0, sticky='W') 
        self.resultCaseWeight.grid(row=0, column=2, sticky='W')
        self.resultCaseAgent.grid(row=1, column=2, sticky='W')
        self.resultHousingType.grid(row=2, column=2, sticky='W')      
        self.resultHoseLengthStatus.grid(row=3, column=2, sticky='W') 
        self.resultHandleTypeStatus.grid(row=4, column=2, sticky='W') 
        self.resultPressureGuageStatus.grid(row=5, column=2, sticky='W') 
        self.resultCaseTypeStatus.grid(row=6, column=2, sticky='W')
        self.resultHousingTypeStatus.grid(row=7, column=2, sticky='W')   
                
        # Create the output entry text fields
        self.outFacility = Entry(self.resultFrame, width=15, state='readonly')
        self.outSerialNum = Entry(self.resultFrame, width=15, state='readonly')
        self.outLocation = Entry(self.resultFrame, width=15, state='readonly')
        self.outInUse = Entry(self.resultFrame, width=15, state='readonly')
        self.outHoseLength = Entry(self.resultFrame, width=15, state='readonly')
        self.outHandleType = Entry(self.resultFrame, width=15, state='readonly')
        self.outPressGuageType = Entry(self.resultFrame, width=15, state='readonly')
        self.outPressGuageRange = Entry(self.resultFrame, width=15, state='readonly')
        self.outCaseWeight = Entry(self.resultFrame, width=15, state='readonly')
        self.outCaseAgent = Entry(self.resultFrame, width=15, state='readonly')
        self.outHousingType = Entry(self.resultFrame, width=15, state='readonly')    
        self.outHoseLengthStatus = Entry(self.resultFrame, width=15, state='readonly') 
        self.outHandleTypeStatus = Entry(self.resultFrame, width=15, state='readonly') 
        self.outPressureGuageStatus = Entry(self.resultFrame, width=15, state='readonly')
        self.outCaseTypeStatus = Entry(self.resultFrame, width=15, state='readonly')
        self.outHousingTypeStatus = Entry(self.resultFrame, width=15, state='readonly')                 
                
        # Create the output grid for the entry fields
        self.outFacility.grid(row=0, column=1, padx=5)
        self.outSerialNum.grid(row=1, column=1) 
        self.outLocation.grid(row=2, column=1) 
        self.outInUse.grid(row=3, column=1) 
        self.outHoseLength.grid(row=4, column=1) 
        self.outHandleType.grid(row=5, column=1) 
        self.outPressGuageType.grid(row=6, column=1) 
        self.outPressGuageRange.grid(row=7, column=1) 
        self.outCaseWeight.grid(row=0, column=3)
        self.outCaseAgent.grid(row=1, column=3)
        self.outHousingType.grid(row=2, column=3)      
        self.outHoseLengthStatus.grid(row=3, column=3) 
        self.outHandleTypeStatus.grid(row=4, column=3) 
        self.outPressureGuageStatus.grid(row=5, column=3) 
        self.outCaseTypeStatus.grid(row=6, column=3)
        self.outHousingTypeStatus.grid(row=7, column=3)  
                        
        # Keep the root window open while the user is interacting with the widgets
        self.root.mainloop()

    def Check_Input(dropArgs):
        """ 
        Function Name: Check_Input
        Function Purpose: This function executes when the user clicks the 'Check' button and finds any missing 
        input fields that will need to be selected before the user can submit to db.
        """   
        # Declare Local Variables
        global blnValidate
        blnValidate = bool(False)

        try:
            if dropArgs != "":
                # Set blnValidated to True
                blnValidate = True
            else:
                messagebox.showwarning(title='ERROR', message='Input should not be empty. Please Try again.')
                blnValidate = False
        except ValueError:
            messagebox.showwarning(title='ERROR', message='Invalid input. Please Try again.')
            blnValidate = False
            
        return blnValidate

    
    def Validate_InputFields(self):
        """ 
        Function Name: Validate_InputFields
        Function Purpose: This function validates the user inputs.
        """
        # Declare Local Variables
        global blnValidate
        blnValidate = bool(False)

        # Check the user input
        blnValidate = NewInspection.Check_Input(self.dropFacility.get())
        
        # Check if the input is valid
        if (blnValidate is True):
            # Check the user input
            blnValidate = NewInspection.Check_Input(self.dropSerialNum.get())
            
            # Check if the input is valid
            if (blnValidate is True):
                # Check the user input
                blnValidate = NewInspection.Check_Input(self.dropLocation.get())

                # Check if the input is valid
                if (blnValidate is True):
                    # Check the user input
                    blnValidate = NewInspection.Check_Input(self.dropInUse.get())

                    # Check if the input is valid
                    if (blnValidate is True):
                        # Check the user input
                        blnValidate = NewInspection.Check_Input(self.dropHose.get())

                        # Check if the input is valid
                        if (blnValidate is True):
                            # Check the user input
                            blnValidate = NewInspection.Check_Input(self.dropHandle.get())

                            # Check if the input is valid
                            if (blnValidate is True):
                                # Check the user input
                                blnValidate = NewInspection.Check_Input(self.dropPressGuageType.get())

                                # Check if the input is valid
                                if (blnValidate is True):
                                    # Check the user input
                                    blnValidate = NewInspection.Check_Input(self.dropPressGuageRange.get())

                                    # Check if the input is valid
                                    if (blnValidate is True):
                                        # Check the user input
                                        blnValidate = NewInspection.Check_Input(self.dropCaseWeight.get())

                                        # Check if the input is valid
                                        if (blnValidate is True):
                                            # Check the user input
                                            blnValidate = NewInspection.Check_Input(self.dropCaseAgent.get())

                                            # Check if the input is valid
                                            if (blnValidate is True):
                                                # Check the user input
                                                blnValidate = NewInspection.Check_Input(self.dropHousing.get())

                                                # Check if the input is valid
                                                if (blnValidate is True):
                                                    
                                                    # Check the user input
                                                    blnValidate = NewInspection.Check_Input(self.optHoseStatus.get())

                                                    # Check if the input is valid
                                                    if (blnValidate is True):
                                                        # Check the user input
                                                        blnValidate = NewInspection.Check_Input(self.optHandleStatus.get())

                                                        # Check if the input is valid
                                                        if (blnValidate is True):                                                        
                                                            # Check the user input
                                                            blnValidate = NewInspection.Check_Input(self.optPressureStatus.get())

                                                            # Check if the input is valid
                                                            if (blnValidate is True):    
                                                                # Check the user input
                                                                blnValidate = NewInspection.Check_Input(self.optCaseStatus.get())

                                                                # Check if the input is valid
                                                                if (blnValidate is True):    
                                                                    # Check the user input
                                                                    blnValidate = NewInspection.Check_Input(self.optHousingStatus.get())

                                                                    # Check if the input is valid
                                                                    if (blnValidate is True):                                                                                                                                                                                            
                                                                        blnValidate = True
                                                                    else:
                                                                        # Return blnValidate as False
                                                                        blnValidate = False
                                                                        self.optHousingStatus.focus()
                                                                else:
                                                                    # Return blnValidate as False
                                                                    blnValidate = False
                                                                    self.optCaseStatus.focus()
                                                            else:
                                                                # Return blnValidate as False
                                                                blnValidate = False
                                                                self.optPressureStatus.focus()
                                                        else:
                                                            # Return blnValidate as False
                                                            blnValidate = False    
                                                            self.optHandleStatus.focus()    
                                                    else:
                                                        # Return blnValidate as False
                                                        blnValidate = False        
                                                        self.optHoseStatus.focus()                                                                                                                                                                                                                                                                                 
                                                else:
                                                    # Return blnValidate as False
                                                    blnValidate = False
                                                    self.dropHousing.focus()
                                            else:
                                                # Return blnValidate as False
                                                blnValidate = False   
                                                self.dropCaseAgent.focus()                                             
                                        else:
                                            # Return blnValidate as False
                                            blnValidate = False
                                            self.dropCaseWeight.focus()
                                    else:
                                        # Return blnValidate as False
                                        blnValidate = False
                                        self.dropPressGuageRange.focus()
                                else:
                                    # Return blnValidate as False
                                    blnValidate = False
                                    self.dropPressGuageType.focus()
                            else:
                                # Return blnValidate as False
                                blnValidate = False
                                self.dropHandle.focus()
                        else:
                            # Return blnValidate as False
                            blnValidate = False
                            self.dropHose.focus()
                    else:
                        # Return blnValidate as False
                        blnValidate = False
                        self.dropInUse.focus()
                else:
                    # Return blnValidate as False
                    blnValidate = False
                    self.dropLocation.focus()
            else:
                # Return blnValidate as False
                blnValidate = False  
                self.dropSerialNum.focus()          
        else:
            # Return blnValidate as False
            blnValidate = False
            self.dropFacility.focus()

            
        return blnValidate    

                                
    def Check_Click(self):
        """ 
        Function Name: Check_Click
        Function Purpose: This function is executed once the user clicks on the check button. Once the inputs 
        are validated, the inspection result frame loads the data selected from the user before the data is 
        committed to the database. If the user clicks 'Reset', all data is set back to default. 
        """
        global blnValidate
        blnValidate = bool(False)
        
        # First check if the input is empty, if so, notify the user the input needs attention 
        blnValidate = NewInspection.Validate_InputFields(self)
        
        # If status is true then proceed to update the result field, else, reset the fields
        if blnValidate is True:
            # Open the submit button so its state is now disabled
            self.btnSubmit.configure(state=ACTIVE)
            self.btnCheck.configure(state=DISABLED)
            
            # Set the state of the output fields to normal before inserting data
            self.outFacility.configure(state='normal')
            self.outSerialNum.configure(state='normal')
            self.outLocation.configure(state='normal')
            self.outInUse.configure(state='normal')
            self.outHoseLength.configure(state='normal')
            self.outHandleType.configure(state='normal')
            self.outPressGuageType.configure(state='normal')
            self.outPressGuageRange.configure(state='normal')
            self.outCaseWeight.configure(state='normal')
            self.outCaseAgent.configure(state='normal')
            self.outHousingType.configure(state='normal')
            self.outHoseLengthStatus.configure(state='normal')
            self.outHandleTypeStatus.configure(state='normal')
            self.outPressureGuageStatus.configure(state='normal')
            self.outCaseTypeStatus.configure(state='normal')
            self.outHousingTypeStatus.configure(state='normal')
            
            # Pass in the data that was selected by the user
            self.outFacility.insert(0, self.dropFacility.get())
            self.outSerialNum.insert(0, self.dropSerialNum.get())
            self.outLocation.insert(0, self.dropLocation.get())
            self.outInUse.insert(0, self.dropInUse.get())
            self.outHoseLength.insert(0, self.dropHose.get())
            self.outHandleType.insert(0, self.dropHandle.get())
            self.outPressGuageType.insert(0, self.dropPressGuageType.get())
            self.outPressGuageRange.insert(0, self.dropPressGuageRange.get())
            self.outCaseWeight.insert(0, self.dropCaseWeight.get())
            self.outCaseAgent.insert(0, self.dropCaseAgent.get())
            self.outHousingType.insert(0, self.dropHousing.get())
            self.outHoseLengthStatus.insert(0, self.optHoseStatus.get())
            self.outHandleTypeStatus.insert(0, self.optHandleStatus.get())
            self.outPressureGuageStatus.insert(0, self.optPressureStatus.get())
            self.outCaseTypeStatus.insert(0, self.optCaseStatus.get())
            self.outHousingTypeStatus.insert(0, self.optHousingStatus.get())        
            # self.outFacility.insert(0, StringVar.get(self.dropFacility))
            
            # Set the entry fields to readonly so the user cannot modify the output        
            self.outFacility.configure(state='readonly')
            self.outSerialNum.configure(state='readonly')
            self.outLocation.configure(state='readonly')
            self.outInUse.configure(state='readonly')
            self.outHoseLength.configure(state='readonly')
            self.outHandleType.configure(state='readonly')
            self.outPressGuageType.configure(state='readonly')
            self.outPressGuageRange.configure(state='readonly')
            self.outCaseWeight.configure(state='readonly')
            self.outCaseAgent.configure(state='readonly')
            self.outHousingType.configure(state='readonly')
            self.outHoseLengthStatus.configure(state='readonly')
            self.outHandleTypeStatus.configure(state='readonly')
            self.outPressureGuageStatus.configure(state='readonly')
            self.outCaseTypeStatus.configure(state='readonly')
            self.outHousingTypeStatus.configure(state='readonly')
            
    def Reset(self):
        """ 
        Function Name: Reset
        Function Purpose: This function is executed once the user clicks on the reset button inside the check
        frame. If the user clicks 'Reset', all data is set back to default.
        """     
        # Open the submit button so its state is now disabled
        self.btnSubmit.configure(state='disabled')
        self.btnCheck.configure(state='normal')
                
        # Set the list objects first element to the drop click object
        self.dropFacility.set("")
        self.dropSerialNum.set("")
        self.dropLocation.set("")
        self.dropInUse.set("")
        self.dropHose.set("")
        self.dropHandle.set("")
        self.dropPressGuageType.set("")
        self.dropPressGuageRange.set("")
        self.dropCaseWeight.set("")
        self.dropCaseAgent.set("")
        self.dropHousing.set("")
        self.dropStatus.set("")
        self.optHoseStatus.set("")
        self.optHandleStatus.set("")
        self.optPressureStatus.set("")
        self.optCaseStatus.set("")
        self.optHousingStatus.set("")
                        
        # Set the state of the output fields to normal before inserting data
        self.outFacility.configure(state='normal')
        self.outSerialNum.configure(state='normal')
        self.outLocation.configure(state='normal')
        self.outInUse.configure(state='normal')
        self.outHoseLength.configure(state='normal')
        self.outHandleType.configure(state='normal')
        self.outPressGuageType.configure(state='normal')
        self.outPressGuageRange.configure(state='normal')
        self.outCaseWeight.configure(state='normal')
        self.outCaseAgent.configure(state='normal')
        self.outHousingType.configure(state='normal')
        self.outHoseLengthStatus.configure(state='normal')
        self.outHandleTypeStatus.configure(state='normal')
        self.outPressureGuageStatus.configure(state='normal')
        self.outCaseTypeStatus.configure(state='normal')
        self.outHousingTypeStatus.configure(state='normal')
        
        # Delete the entry text fields and switch the state to disabled
        self.outFacility.delete(0, END)
        self.outSerialNum.delete(0, END)
        self.outLocation.delete(0, END)
        self.outInUse.delete(0, END)
        self.outHoseLength.delete(0, END)
        self.outHandleType.delete(0, END)
        self.outPressGuageType.delete(0, END)
        self.outPressGuageRange.delete(0, END)
        self.outCaseWeight.delete(0, END)
        self.outCaseAgent.delete(0, END)
        self.outHousingType.delete(0, END)    
        self.outHoseLengthStatus.delete(0, END) 
        self.outHandleTypeStatus.delete(0, END) 
        self.outPressureGuageStatus.delete(0, END)
        self.outCaseTypeStatus.delete(0, END)
        self.outHousingTypeStatus.delete(0, END)     
        
        # Set the entry fields to readonly so the user cannot modify the output        
        self.outFacility.configure(state='readonly')
        self.outSerialNum.configure(state='readonly')
        self.outLocation.configure(state='readonly')
        self.outInUse.configure(state='readonly')
        self.outHoseLength.configure(state='readonly')
        self.outHandleType.configure(state='readonly')
        self.outPressGuageType.configure(state='readonly')
        self.outPressGuageRange.configure(state='readonly')
        self.outCaseWeight.configure(state='readonly')
        self.outCaseAgent.configure(state='readonly')
        self.outHousingType.configure(state='readonly')
        self.outHoseLengthStatus.configure(state='readonly')
        self.outHandleTypeStatus.configure(state='readonly')
        self.outPressureGuageStatus.configure(state='readonly')
        self.outCaseTypeStatus.configure(state='readonly')
        self.outHousingTypeStatus.configure(state='readonly')

    def Get_UserInput(self):
        """ 
        Function Name: Get_UserInput
        Function Purpose: This function is executed once the user clicks on the submit button inside the result
        frame. If the user clicks 'Submit', all data is pulled and dumped into the corresponding class objects. 
        Then the data will be sent to the db.
        """       
        # Find the index location for the selected values
        Facility.strFacilityName = self.dropFacility.get()
        self.intFacilityID = Facility.astrFacilityName.index(self.strFacilityName) + 1
        
        # Find the index location for the selected values
        FireEx.strSerialNum = self.dropSerialNum.get()
        self.intFireExID = FireEx.astrSerialNum.index(self.strSerialNum) + 1

        # Find the index location for the selected values
        Location.astrLocationDesc = self.dropLocation.get()
        self.intLocationID = Location.astrLocationDesc.index(self.astrLocationDesc) + 1
        
        # Find the index location for the selected values
        FireEx.blnDeviceInUse = self.dropInUse.get()
        
        # Find the index location for the selected values
        Hose.strHoseLength = self.dropHose.get()
        self.intHoseID = Hose.astrHoseLength.index(self.strHoseLength) + 1
        
        # Find the index location for the selected values
        Handle.strHandleType = self.dropHandle.get()
        self.intHandleID = Handle.astrHandleType.index(self.strHandleType) + 1
        
        # Find the index location for the selected values
        PressGuage.strPressureType = self.dropPressGuageType.get()
        PressGuageTypeID = PressGuage.astrPressureType.index(self.strPressureType) + 1
        
        # Find the index location for the selected values
        PressGuage.strPressureRange = self.dropPressGuageRange.get()        
        PressGuageRangeID= PressGuage.astrPressureRange.index(self.strPressureRange) + 1
        
        # Get the PressGuageID
        PressGuage.intPressGuageID = SQLQueries.Load_PressGuageData_Query(PressGuageTypeID, PressGuageRangeID)
                
        # Find the index location for the selected values
        Case.strCaseWeight = self.dropCaseWeight.get()
        CaseWeightID = Case.astrCaseWeight.index(self.strCaseWeight) + 1
        
        # Find the index location for the selected values
        Case.strCaseAgents = self.dropCaseAgent.get()
        CaseAgentID = Case.astrCaseAgents.index(self.strCaseAgents) + 1

        # Get the CaseID
        Case.intCaseID = SQLQueries.Load_CaseData_Query(CaseWeightID, CaseAgentID)
                
        # Find the index location for the selected values
        Housing.strHousingDesc = self.dropHousing.get()
        self.intHousingID = Housing.astrHousingDesc.index(Housing.strHousingDesc) + 1
        
        # Find the index location for the selected values
        HoseStatus = self.optHoseStatus.get()
        HoseStatusID = InspectionStatus.astrInspectionStatusDesc.index(HoseStatus) + 1
        
        # Find the index location for the selected values
        HandleStatus = self.optHandleStatus.get()
        HandleStatusID = InspectionStatus.astrInspectionStatusDesc.index(HandleStatus) + 1

        # Find the index location for the selected values
        PressStatus = self.optPressureStatus.get()
        PressStatusID = InspectionStatus.astrInspectionStatusDesc.index(PressStatus) + 1        
        
        # Find the index location for the selected values
        CaseStatus = self.optCaseStatus.get()
        CaseStatusID = InspectionStatus.astrInspectionStatusDesc.index(CaseStatus) + 1

        # Find the index location for the selected values
        HouseStatus = self.optHousingStatus.get()
        HouseStatusID = InspectionStatus.astrInspectionStatusDesc.index(HouseStatus) + 1
                        
        # Add the data the corresponding classes
        h = Hose(self.intHoseID, self.strHoseLength)
        i = InspectionStatus(HoseStatusID, HoseStatus)
        StandardHoseInspect.Add_StandHoseInspect_Query(self, h.intHoseID, i.intInspectionStatusID)
        
        # Add the data the corresponding classes
        h = Handle(self.intHandleID, self.strHandleType)
        i = InspectionStatus(HandleStatusID, HandleStatus)
        StandardHandelInspect.Add_StandHandleInspect_Query(self, h.intHandleID, i.intInspectionStatusID)

        # Add the data the corresponding classes
        p = PressGuage(self.intPressGuageID, self.strPressureType, self.strPressureRange)
        i = InspectionStatus(PressStatusID, PressStatus)
        StandardPressGuageInspect.Add_StandPressGuageInspect_Query(self, p.intPressGuageID, i.intInspectionStatusID)
        
        # Add the data the corresponding classes
        c = Case(self.intCaseID, self.strCaseWeight, self.strCaseAgents)
        i = InspectionStatus(CaseStatusID, CaseStatus)
        StandardCaseInspect.Add_StandCaseInspect_Query(self, c.intCaseID, i.intInspectionStatusID)
                
        # Add the data the corresponding classes
        h = Housing(self.intHousingID, self.strHousingDesc)
        i = InspectionStatus(HouseStatusID, HouseStatus)
        StandardHouseInspect.Add_StandHousingInspect_Query(self, h.intHousingID, i.intInspectionStatusID)                

        # Upload the standard inspections to the database
        NewInspection.Upload_StandardInspection(self)
        
        
    def Upload_StandardInspection(self):
        """ 
        Function Name: Upload_StandardInspection
        Function Purpose: This function is executed once the data is dumped into the corresponding class objects and 
        uploaded to the database. The last step is to add a new standard inspection and new FireEx inspections
        """       
        # Get the Max ID values
        StandardHoseInspect.Get_MaxStandHoseInspectID(self)
        StandardHandelInspect.Get_MaxStandHandleInspectID(self)
        StandardPressGuageInspect.Get_MaxPressGuageInspectID(self)
        StandardCaseInspect.Get_MaxCaseInspectID(self)
        StandardHouseInspect.Get_MaxHousingInspectID(self)

        # Add the new standard inspection to the DB
        StandardInspect.Add_StandardInspect_Query(self)
        NewInspection.Upload_FireEx_Inspection(self)
        
    def Upload_FireEx_Inspection(self):
        """ 
        Function Name: Upload_FireEx_Inspection
        Function Purpose: This function is executed once the new standard inspection has been uploaded to the db.
        This function uploads a new fire ex inspection.
        """       
        # Get the max ID for Standard Inspection
        StandardInspect.Get_MaxStandardInspectID(self)
        
        # Pass in the new fire ex inspection data to upload the database 
        FireExInspect.Add_FireExInspection_Query(self)
        FireExInspect.Add_FireExInspector_Query(self)
        FireExInspect.Add_FireExLocation_Query(self)
        FireExInspect.Add_FireExFacilityLocation_Query(self)
        
        # Reset the fields
        NewInspection.Reset(self)            
        
    def Submit(self):
        """ 
        Function Name: Submit
        Function Purpose: This function is executed once the user clicks on the submit button inside the result
        frame. If the user clicks 'Submit', all data is set back to default, the information verified by the user
        is then uploaded to the database and the user will be asked if they would like to do another inspection 
        by a pop up window. 
        """       
        # Upload the Data
        NewInspection.Get_UserInput(self)
        
        # Check if the user would liket to add another unit
        if messagebox.askyesno(title='Continuation Request', message='Unit inspection was successfully uploaded. Would you like to inspect another unit?') is True:
            # Clear the input fields and after data is submitted to the database
            NewInspection.Reset(self)
        else:
            Start_Menu.Delete_Obj_Lists(self)
            NewInspection.Exit(self)        
    
    def Exit(self):
        """ 
        Function Name: Exit
        Function Purpose: This function is executed once the user clicks on the exit button inside the result
        frame. If the user clicks 'Exit', the widow is destroyed and the user is sent back to main menu 
        """         
        self.root.destroy()
        Start_Menu()


class AddUnit(FireEx, Case):
    """
    Class Name: AddUnit
    Class Description: This class adds a unit to the database.
    """
    def __init__(self):
        # Create the root tkinter variable
        self.root = Tk()
                
        # Create the Window attributes
        self.WindowTitle = self.root.title("Add New Fire Extinguisher")
        self.WindowGeo = self.root.geometry("380x310")
        self.WindowSize = self.root.resizable(False, False)

        # Create the second frame to hold the input fields
        self.frameInput = LabelFrame(self.root, text="Unit Credentials")
        self.frameInput.place(x=5, y=5, width=370, height=240)

        # Create the labels 
        self.lblCaseWeight = Label(self.frameInput, text="Case Weight:")
        self.lblCaseAgent = Label(self.frameInput, text="Case Agent:")
        self.lblSerialNum = Label(self.frameInput, text="Serial Number:")
        self.lblManuDate = Label(self.frameInput, text="Manufacture Date:")
        self.lblGet_ServiceDate = Label(self.frameInput, text="Service Date:")
        self.lblReserviceDate = Label(self.frameInput, text="Re-service Date:")
        self.lblInstallDate = Label(self.frameInput, text="Install Date:")
        self.lblDeviceInUse = Label(self.frameInput, text="Device In Use:")

        # Create the label locations
        self.lblCaseWeight.grid(row=0, column=0, sticky='W')
        self.lblCaseAgent.grid(row=1, column=0, sticky='W')
        self.lblSerialNum.grid(row=2, column=0, sticky='W')
        self.lblManuDate.grid(row=3, column=0, sticky='W')
        self.lblGet_ServiceDate.grid(row=4, column=0, sticky='W')
        self.lblReserviceDate.grid(row=5, column=0, sticky='W')
        self.lblInstallDate.grid(row=6, column=0, sticky='W')
        self.lblDeviceInUse.grid(row=7, column=0, sticky='W')

        # Create the drop down menut list objects
        self.dropCaseWeight = ttk.Combobox(self.frameInput, values=Case.astrCaseWeight, state='readonly')
        self.dropCaseAgent = ttk.Combobox(self.frameInput, values=Case.astrCaseAgents, state='readonly')
        self.dropInUse = ttk.Combobox(self.frameInput, values=['Yes', 'No'], state='readonly')

        # Create the drop down menu size for each attribute
        self.dropCaseWeight.configure(width=15)
        self.dropCaseAgent.configure(width=15)
        self.dropInUse.configure(width=15)
        
        # Create the grid for the drop down menu
        self.dropCaseWeight.grid(row=0, column=1, padx=10)
        self.dropCaseAgent.grid(row=1, column=1, padx=10)
        self.dropInUse.grid(row=7, column=1, padx=10)

        # Create the entry input box
        self.SerialNumInput = Entry(self.frameInput, width=25)
        self.ManuDateInput = Entry(self.frameInput, width=25)
        self.ServiceDateInput = Entry(self.frameInput, width=25)
        self.ReserviceDateInput = Entry(self.frameInput, width=25, state='readonly')
        self.InstallDateInput = Entry(self.frameInput, width=25)

        # Create the grid for all of the entry input fields
        self.SerialNumInput.grid(row=2, column=1)
        self.ManuDateInput.grid(row=3, column=1)
        self.ServiceDateInput.grid(row=4, column=1)
        self.ReserviceDateInput.grid(row=5, column=1)
        self.InstallDateInput.grid(row=6, column=1)

        # Create the submit frame
        self.submitFrame = LabelFrame(self.root, text="Submit Entry")
        self.submitFrame.place(x=5, y=250, width=370, height=55)

        # Create the buttons
        self.btnSubmit = Button(self.submitFrame, text="Submit", width=5, command=lambda:AddUnit.Submit(self))
        self.btnExit = Button(self.submitFrame, text="Exit", width=5, command=lambda:AddUnit.Exit(self))
        self.btnReset = Button(self.submitFrame, text="Reset", width=5, command=lambda:AddUnit.Reset(self))

        # Create the button grid
        self.btnSubmit.grid(row=0, column=0, padx=20)
        self.btnReset.grid(row=0, column=1, padx=20)
        self.btnExit.grid(row=0, column=2, padx=20)
                
        # Keep the root window open while the user is interacting with the widgets
        self.root.mainloop()

    def Check_Input(dropArgs):
        """ 
        Function Name: Check_Input
        Function Purpose: This function executes when the user clicks the 'Check' button and finds any missing 
        input fields that will need to be selected before the user can submit to db.
        """   
        # Declare Local Variables
        global blnValidate
        blnValidate = bool(False)

        try:
            if dropArgs != "":
                # Set blnValidated to True
                blnValidate = True
            else:
                messagebox.showwarning(title='ERROR', message='Input should not be empty. Please Try again.')
                blnValidate = False
        except ValueError:
            messagebox.showwarning(title='ERROR', message='Invalid input. Please Try again.')
            blnValidate = False
            
        return blnValidate
        
    def Validate_InputFields(self):
        """ 
        Function Name: Validate_InputFields
        Function Purpose: This function validates the user inputs.
        """
        # Declare Local Variables
        global blnValidate
        blnValidate = bool(False)

        # Check the user input
        blnValidate = AddUnit.Check_Input(self.SerialNumInput.get())

        # Check if the input is valid
        if (blnValidate is True):
            # Check the user input
            blnValidate = BaseFunctions.Validate_Serial_Input(self.SerialNumInput.get())
                    
            # Check if the input is valid
            if (blnValidate is True):
                # Check the user input
                blnValidate = AddUnit.Check_Input(self.ManuDateInput.get())

                # Check if the input is valid
                if (blnValidate is True):
                    # Check the user input
                    blnValidate = BaseFunctions.Validate_Date_Input(self.ManuDateInput.get())
                            
                    # Check if the input is valid
                    if (blnValidate is True):
                        # Check the user input
                        blnValidate = AddUnit.Check_Input(self.ServiceDateInput.get())

                        # Check if the input is valid
                        if (blnValidate is True):
                            # Check the user input
                            blnValidate = BaseFunctions.Validate_Date_Input(self.ServiceDateInput.get())
                            
                            # Check if the input is valid
                            if (blnValidate is True):
                                # Add a single year to the service date
                                aDateResult = BaseFunctions.Update_Service_InspectionDate(self.ServiceDateInput.get())
                                self.ReserviceDateInput.configure(state='normal')
                                self.ReserviceDateInput.insert(0, datetime.strftime(aDateResult[1], '%m/%d/%Y'))
                                self.ReserviceDateInput.configure(state='readonly')
                                                            
                                # Check the user input
                                blnValidate = AddUnit.Check_Input(self.InstallDateInput.get())

                                # Check if the input is valid
                                if (blnValidate is True):
                                    # Check the user input
                                    blnValidate = BaseFunctions.Validate_Date_Input(self.InstallDateInput.get())        
                                                                    
                                    # Check if the input is valid
                                    if (blnValidate is True):
                                        # Check the user input
                                        blnValidate = AddUnit.Check_Input(self.dropCaseWeight.get())
                                        
                                        # Check if the input is valid
                                        if (blnValidate is True):
                                            # Check the user input
                                            blnValidate = AddUnit.Check_Input(self.dropCaseAgent.get())                            
                                                            
                                            # Check if the input is valid
                                            if (blnValidate is True):
                                                # Check the user input
                                                blnValidate = AddUnit.Check_Input(self.dropInUse.get())         
                                                                                            
                                                # Check if the input is valid
                                                if (blnValidate is True):
                                                    blnValidate = True
                                                else:
                                                    # Return blnValidate as False
                                                    blnValidate = False
                                                    self.dropInUse.focus()   
                                            else:
                                                # Return blnValidate as False
                                                blnValidate = False
                                                self.dropCaseAgent.focus()      
                                        else:
                                            # Return blnValidate as False
                                            blnValidate = False
                                            self.dropCaseWeight.focus()                                                                                          
                                    else:
                                        # Return blnValidate as False
                                        blnValidate = False
                                        self.InstallDateInput.delete(0, END)
                                        self.InstallDateInput.configure(background='Yellow')            
                                else:
                                    # Return blnValidate as False
                                    blnValidate = False
                                    self.InstallDateInput.delete(0, END)
                                    self.InstallDateInput.configure(background='Yellow')                                                                                                                                                                
                            else:
                                # Return blnValidate as False
                                blnValidate = False
                                self.ServiceDateInput.delete(0, END)
                                self.ServiceDateInput.configure(background='Yellow')                
                        else:
                            # Return blnValidate as False
                            blnValidate = False
                            self.ServiceDateInput.delete(0, END)
                            self.ServiceDateInput.configure(background='Yellow')                                           
                    else:
                        # Return blnValidate as False
                        blnValidate = False    
                        self.ManuDateInput.delete(0, END)
                        self.ManuDateInput.configure(background='Yellow')      
                else:
                    # Return blnValidate as False
                    blnValidate = False    
                    self.ManuDateInput.delete(0, END)
                    self.ManuDateInput.configure(background='Yellow')                           
            else:
                # Return blnValidate as False
                blnValidate = False
                self.SerialNumInput.delete(0, END)
                self.SerialNumInput.configure(background='Yellow')                                          
        else:
            # Return blnValidate as False
            blnValidate = False
            self.SerialNumInput.delete(0, END)
            self.SerialNumInput.configure(background='Yellow')

        return blnValidate

    def Get_UserInput(self):
        """ 
        Function Name: Get_UserInput
        Function Purpose: This function is executed once the user clicks on the submit button inside the result
        frame. If the user clicks 'Submit', all data is pulled and dumped into the corresponding class objects. 
        Then the data will be sent to the db.
        """       
        # Get the current date for last and next inspection
        aDateResult = BaseFunctions.Update_Inspection_Date()
        lastDate = datetime.strftime(aDateResult[0], '%m/%d/%Y')
        nextDate =  datetime.strftime(aDateResult[1], '%m/%d/%Y')
        
        # Assign value to the objects
        FireEx.strSerialNum = self.SerialNumInput.get()
        FireEx.dtmManufactureDate = datetime.strptime(self.ManuDateInput.get(), '%m/%d/%Y')
        FireEx.dtmServiceDate = datetime.strptime(self.ServiceDateInput.get(), '%m/%d/%Y')
        FireEx.dtmReserviceDate = datetime.strptime(self.ReserviceDateInput.get(), '%m/%d/%Y')
        FireEx.dtmInstallationDate = datetime.strptime(self.InstallDateInput.get(), '%m/%d/%Y')
        FireEx.dtmLastInspectionDate = datetime.strptime(lastDate, '%m/%d/%Y')
        FireEx.dtmNextInspectionDate = datetime.strptime(nextDate, '%m/%d/%Y')
        FireEx.blnDeviceInUse = self.dropInUse.get()
        
        # Find the index location for the selected values
        Case.strCaseWeight = self.dropCaseWeight.get()
        CaseWeightID = Case.astrCaseWeight.index(self.strCaseWeight) + 1
        
        # Find the index location for the selected values
        Case.strCaseAgents = self.dropCaseAgent.get()
        CaseAgentID = Case.astrCaseAgents.index(self.strCaseAgents) + 1

        # Get the CaseID
        Case.intCaseID = SQLQueries.Load_CaseData_Query(CaseWeightID, CaseAgentID)
        c = Case(self.intCaseID, self.strCaseWeight, self.strCaseAgents)        
        
        # Pass to the FireEx Class
        f = FireEx(int(0), self.strSerialNum, self.dtmManufactureDate, self.dtmServiceDate, 
                   self.dtmReserviceDate, self.dtmInstallationDate, self.dtmLastInspectionDate,
                   self.dtmNextInspectionDate, self.blnDeviceInUse)  
        
    def Clear_BG_Color(self):
        """ 
        Function Name: Clear_BG_Color
        Function Purpose: This button executes when the user submits their entries and clears the background
        color before any validation checks.
        """
        # Delete the button after submission
        self.SerialNumInput.configure(background='White')
        self.ManuDateInput.configure(background='White')
        self.ServiceDateInput.configure(background='White')
        self.ReserviceDateInput.configure(background='White')
        self.InstallDateInput.configure(background='White')
        
    def Reset(self):
        """ 
        Function Name: Reset
        Function Purpose: This button executes when the user wants to reset the values.
        """
        # Delete the button after submission
        self.SerialNumInput.delete(0, END)
        self.ManuDateInput.delete(0, END)
        self.ServiceDateInput.delete(0, END)
        self.ReserviceDateInput.delete(0, END)
        self.InstallDateInput.delete(0, END)
        
        # Reset the drop menus
        self.dropCaseWeight.set("")
        self.dropCaseAgent.set("")
        self.dropInUse.set("")
        
        # Clear out the background colors and set to default as 'white'
        AddUnit.Clear_BG_Color(self)

    def Submit(self):
        """ 
        Function Name: Submit
        Function Purpose: This button executes when the user wants to sumbit the values to the db. First check
        if all of the values are valid. If yes, proceed to upload the new FireEx unit to the db. Else, reset
        """
        # Check if all of the inputs are valid
        global blnValidate 
        blnValidate = bool(False)
        
        # Clear out the background colors and set to default as 'white'
        AddUnit.Clear_BG_Color(self)
        
        # Get the blnValidate status
        blnValidate = AddUnit.Validate_InputFields(self)
        
        # Check if the input is valid
        if (blnValidate is True):
            AddUnit.Get_UserInput(self)
            FireEx.Add_NewFireEx_Query(self)
            
            # Check if the user would liket to add another unit
            if messagebox.askyesno(title='Continuation Request', message='Unit was successfully uploaded. Would you like to add another unit?') is True:
                # Clear the input fields and after data is submitted to the database
                AddUnit.Reset(self)
                AddUnit()
            else:
                AddUnit.Exit(self)
        else:
            # Return blnValidate as False
            blnValidate = False

    def Exit(self):
        """ 
        Function Name: Exit
        Function Purpose: This function is executed once the user clicks on the exit button inside the result
        frame. If the user clicks 'Exit', the widow is destroyed and the user is sent back to main menu 
        """         
        self.root.destroy()
        Start_Menu()        


# class AddInspector(root):
#     """
#     Class Name: AddInspector
#     Class Description: This class adds a Inspector to the database.
#     """
#     def __init__(self):
#         # Create the Window attributes
#         self.WindowTitle = root.title("Add New Inspector")
#         self.WindowGeo = root.geometry("330x240")
#         self.WindowSize = root.resizable(False, False)

#         # Create the second frame to hold the input fields
#         self.frameInput = LabelFrame(root, text="User Credentials")
#         self.frameInput.place(x=5, y=5, width=320, height=170)

#         # Create the labels 
#         self.lblFName = Label(self.frameInput, text="First Name:")
#         self.lblLName = Label(self.frameInput, text="Last Name:")
#         self.lblEmail = Label(self.frameInput, text="Email:")
#         self.lblPassword = Label(self.frameInput, text="Password:")
#         self.lblPasswordReEnter = Label(self.frameInput, text="Password:")

#         # Create the label locations
#         self.lblFName.grid(row=0, column=0)
#         self.lblLName.grid(row=1, column=0)
#         self.lblEmail.grid(row=2, column=0)
#         self.lblPassword.grid(row=3, column=0)
#         self.lblPasswordReEnter.grid(row=4, column=0)        

#         # Create the entry input box
#         self.FNameInput = Entry(self.frameInput, width=25)
#         self.LNameInput = Entry(self.frameInput, width=25)
#         self.EmailInput = Entry(self.frameInput, width=25)
#         self.PasswordInput = Entry(self.frameInput, width=25)
#         self.PasswordReEnterInput = Entry(self.frameInput, width=25)

#         # Create the grid for all of the entry input fields
#         self.FNameInput.grid(row=0, column=1)
#         self.LNameInput.grid(row=1, column=1)
#         self.EmailInput.grid(row=2, column=1)
#         self.PasswordInput.grid(row=3, column=1)
#         self.PasswordReEnterInput.grid(row=4, column=1)

#         # Get the user inputs
#         self.FNameInput.get()
#         self.LNameInput.get()
#         self.EmailInput.get()
#         self.PasswordInput.get()
#         self.PasswordReEnterInput.get()
            
#         def Get_FirstName(self):
#             """ 
#             Function Name: Get_FirstName
#             Function Purpose: This function gets the user first name.
#             """
#             # Declare Local Variables
#             global blnValidate
#             blnValidate = bool(False)
            
#             try:
#                 if self.FNameInput.get() != "":
#                     # Set blnValidated to True
#                     blnValidate = True
#                 else:
#                     messagebox.showwarning(title='ERROR', message=['Input should not be empty. Please Try again.'])
#                     self.FNameInput.delete(0, END)
#                     self.FNameInput.configure(background='Yellow')
#                     blnValidate = False
#             except ValueError:
#                 messagebox.showwarning(title='ERROR', message='Invalid input. Please Try again.')
#                 self.FNameInput.delete(0, END)
#                 self.FNameInput.configure(background='Yellow')
#                 blnValidate = False
                
#             return blnValidate
        
#         def Get_LastName(self):
#             """ 
#             Function Name: Get_LastName
#             Function Purpose: This function gets the user last name.
#             """   
#             # Declare Local Variables
#             global blnValidate
#             blnValidate = bool(False)
            
#             try:
#                 if self.LNameInput.get() != "":
#                     # Set blnValidated to True
#                     blnValidate = True
#                 else:
#                     messagebox.showwarning(title='ERROR', message='Input should not be empty. Please Try again.')
#                     self.LNameInput.delete(0, END)
#                     self.LNameInput.configure(background='Yellow')
#                     blnValidate = False
#             except ValueError:
#                 messagebox.showwarning(title='ERROR', message='Invalid input. Please Try again.')
#                 self.LNameInput.delete(0, END)
#                 self.LNameInput.configure(background='Yellow')       
#                 blnValidate = False
                
#             return blnValidate
            
#         def Get_Email(self):
#             """ 
#             Function Name: Get_Email
#             Function Purpose: This function gets the user email.
#             """   
#             # Declare Local Variables
#             global blnValidate
#             blnValidate = bool(False)
            
#             try:
#                 if self.EmailInput.get() != "":
#                     # Set blnValidated to True
#                     blnValidate = True
#                 else:
#                     messagebox.showwarning(title='ERROR', message='Input should not be empty. Please Try again.')
#                     self.EmailInput.delete(0, END)
#                     self.EmailInput.configure(background='Yellow')
#                     blnValidate = False
#             except ValueError:
#                 messagebox.showwarning(title='ERROR', message='Invalid input. Please Try again.')
#                 self.EmailInput.delete(0, END)
#                 self.EmailInput.configure(background='Yellow')
#                 blnValidate = False
                
#             return blnValidate
            
#         def Get_Password(self):
#             """ 
#             Function Name: Get_Password
#             Function Purpose: This function gets the user's password.
#             """   
#             # Declare Local Variables
#             global blnValidate
#             blnValidate = bool(False)
            
#             try:
#                 if self.PasswordInput.get() != "":
#                     # Set blnValidated to True
#                     blnValidate = True
#                 else:
#                     messagebox.showwarning(title='ERROR', message='Input should not be empty. Please Try again.')
#                     self.PasswordInput.delete(0, END)
#                     self.PasswordInput.configure(background='Yellow')
#                     blnValidate = False
#             except ValueError:
#                 messagebox.showwarning(title='ERROR', message='Invalid input. Please Try again.')
#                 self.PasswordInput.delete(0, END)
#                 self.PasswordInput.configure(background='Yellow')
#                 blnValidate = False
                
#             return blnValidate
            
#         def Validate_InputFields(self):
#             """ 
#             Function Name: Validate_InputFields
#             Function Purpose: This function validates the user inputs.
#             """
#             # Declare Local Variables
#             global blnValidate
#             blnValidate = bool(False)

#             # Check the user input
#             blnValidate = Get_FirstName(self)
            
#             # Check if the input is valid
#             if (blnValidate is True):
#                 # Check the user input
#                 blnValidate = Get_LastName(self)
                
#                 # Check if the input is valid
#                 if (blnValidate is True):
#                     # Check the user input
#                     blnValidate = Get_Email(self)

#                     # Check if the input is valid
#                     if (blnValidate is True):
#                         # Check the user input
#                         blnValidate = Get_Password(self)

#                         # Check if the input is valid
#                         if (blnValidate is True):
#                             blnValidate = True
#                         else:
#                             # Return blnValidate as False
#                             blnValidate = False
#                     else:
#                         # Return blnValidate as False
#                         blnValidate = False
#                 else:
#                     # Return blnValidate as False
#                     blnValidate = False            
#             else:
#                 # Return blnValidate as False
#                 blnValidate = False

                
#             return blnValidate

#         def Clear_BG_Color(self):
#             """ 
#             Function Name: Clear_BG_Color
#             Function Purpose: This button executes when the user submits their entries and clears the background
#             color before any validation checks.
#             """
#             # Delete the button after submission
#             self.FNameInput.configure(background='White')
#             self.LNameInput.configure(background='White')
#             self.EmailInput.configure(background='White')
#             self.PasswordInput.configure(background='White')
#             self.PasswordReEnterInput.configure(background='White')
            
#         def Reset(self):
#             """ 
#             Function Name: Reset
#             Function Purpose: This button executes when the user wants to reset the values.
#             """
#             # Delete the button after submission
#             self.FNameInput.delete(0, END)
#             self.LNameInput.delete(0, END)
#             self.EmailInput.delete(0, END)
#             self.PasswordInput.delete(0, END)
#             self.PasswordReEnterInput.delete(0, END)
            
#             # Clear out the background colors and set to default as 'white'
#             Clear_BG_Color(self)

#         def Submit(self):
#             """ 
#             Function Name: Submit
#             Function Purpose: This button executes when the user wants to sumbit the values to the db. First check
#             if all of the values are valid. If yes, proceed to upload the new inspector to the db. Else, reset
#             """
#             # Check if all of the inputs are valid
#             global blnValidate 
#             blnValidate = bool(False)
            
#             # Clear out the background colors and set to default as 'white'
#             Clear_BG_Color(self)
            
#             # Get the blnValidate status
#             blnValidate = Validate_InputFields(self)
            
#             # Check if the input is valid
#             if (blnValidate is True):
#                 blnValidate = True
#             else:
#                 # Return blnValidate as False
#                 blnValidate = False
            
#         # Create the submit frame
#         self.submitFrame = LabelFrame(root, text="Submit Entry")
#         self.submitFrame.place(x=5, y=180, width=320, height=50)

#         # Create the buttons
#         self.btnSubmit = Button(self.submitFrame, text="Submit", width=5, command=Submit)
#         self.btnExit = Button(self.submitFrame, text="Exit", width=5)
#         self.btnReset = Button(self.submitFrame, text="Reset", width=5, command=Reset)

#         # Create the button grid
#         self.btnSubmit.grid(row=0, column=0, padx=15)
#         self.btnReset.grid(row=0, column=1, padx=10)
#         self.btnExit.grid(row=0, column=2, padx=10)

#         # Create the root main loop
#         root.mainloop()

           
# class AddFacility(root):
#     """
#     Class Name: AddFacility
#     Class Description: This class adds a New Facility to the database.
#     """
#     def __init__(self):
#         # Create the Window attributes
#         self.WindowTitle = root.title("Add New Facility")
#         self.WindowGeo = root.geometry("330x240")
#         self.WindowSize = root.resizable(False, False)

#         # Create the second frame to hold the input fields
#         self.frameInput = LabelFrame(root, text="Facility Credentials")
#         self.frameInput.place(x=5, y=5, width=320, height=170)

#         # Create the labels 
#         self.lblFacilityName = Label(self.frameInput, text="Facility Name:")
#         self.lblAddress = Label(self.frameInput, text="Address:")
#         self.lblState = Label(self.frameInput, text="State:")
#         self.lblZip= Label(self.frameInput, text="Zip:")
#         self.lblPhoneNum= Label(self.frameInput, text="Phone Number:")

#         # Create the label locations
#         self.lblFacilityName.grid(row=0, column=0)
#         self.blAddress.grid(row=1, column=0)
#         self.lblState.grid(row=2, column=0)
#         self.lblZip.grid(row=3, column=0)
#         self.lblPhoneNum.grid(row=4, column=0)

#         # Create the entry input box
#         self.FacilityNameInput = Entry(self.frameInput, width=22)
#         self.AddressInput = Entry(self.frameInput, width=22)
#         self.StateInput = Entry(self.frameInput, width=22)
#         self.ZipInput = Entry(self.frameInput, width=22)
#         self.PhoneNumInput = Entry(self.frameInput, width=22)

#         # Create the grid for all of the entry input fields
#         self.FacilityNameInput.grid(row=0, column=1)
#         self.AddressInput.grid(row=1, column=1)
#         self.StateInput.grid(row=2, column=1)
#         self.ZipInput.grid(row=3, column=1)
#         self.PhoneNumInput.grid(row=4, column=1)

#         # Get the user inputs
#         self.FacilityNameInput.get()
#         self.AddressInput.get()
#         self.tateInput.get()
#         self.ZipInput.get()
#         self.PhoneNumInput.get()
            
#         def Get_FacilityName(self):
#             """ 
#             Function Name: Get_FacilityName
#             Function Purpose: This function gets the user Facility name.
#             """
#             # Declare Local Variables
#             global blnValidate
#             blnValidate = bool(False)
            
#             try:
#                 if self.FacilityNameInput.get() != "":
#                     # Set blnValidated to True
#                     blnValidate = True
#                 else:
#                     messagebox.showwarning(title='ERROR', message=['Input should not be empty. Please Try again.'])
#                     self.FacilityNameInput.delete(0, END)
#                     self.FacilityNameInput.configure(background='Yellow')
#                     blnValidate = False
#             except ValueError:
#                 messagebox.showwarning(title='ERROR', message='Invalid input. Please Try again.')
#                 self.FacilityNameInput.delete(0, END)
#                 self.FacilityNameInput.configure(background='Yellow')
#                 blnValidate = False
                
#             return blnValidate
        
#         def Get_Address():
#             """ 
#             Function Name: Get_Address
#             Function Purpose: This function gets the Facility Address.
#             """   
#             # Declare Local Variables
#             global blnValidate
#             blnValidate = bool(False)
            
#             try:
#                 if self.AddressInput.get() != "":
#                     # Set blnValidated to True
#                     blnValidate = True
#                 else:
#                     messagebox.showwarning(title='ERROR', message='Input should not be empty. Please Try again.')
#                     self.AddressInput.delete(0, END)
#                     self.AddressInput.configure(background='Yellow')
#                     blnValidate = False
#             except ValueError:
#                 messagebox.showwarning(title='ERROR', message='Invalid input. Please Try again.')
#                 self.AddressInput.delete(0, END)
#                 self.AddressInput.configure(background='Yellow')       
#                 blnValidate = False
                
#             return blnValidate
            
#         def Get_State():
#             """ 
#             Function Name: Get_State
#             Function Purpose: This function gets the Facility State.
#             """   
#             # Declare Local Variables
#             global blnValidate
#             blnValidate = bool(False)
            
#             try:
#                 if self.StateInput.get() != "":
#                     # Set blnValidated to True
#                     blnValidate = True
#                 else:
#                     messagebox.showwarning(title='ERROR', message='Input should not be empty. Please Try again.')
#                     self.StateInput.delete(0, END)
#                     self.StateInput.configure(background='Yellow')
#                     blnValidate = False
#             except ValueError:
#                 messagebox.showwarning(title='ERROR', message='Invalid input. Please Try again.')
#                 self.StateInput.delete(0, END)
#                 self.StateInput.configure(background='Yellow')
#                 blnValidate = False
                
#             return blnValidate
            
#         def Get_Zip():
#             """ 
#             Function Name: Get_password
#             Function Purpose: This function gets the Facility Zip Code.
#             """   
#             # Declare Local Variables
#             global blnValidate
#             blnValidate = bool(False)
            
#             try:
#                 if self.ZipInput.get() != "":
#                     # Set blnValidated to True
#                     blnValidate = True
#                 else:
#                     messagebox.showwarning(title='ERROR', message='Input should not be empty. Please Try again.')
#                     self.ZipInput.delete(0, END)
#                     self.ZipInput.configure(background='Yellow')
#                     blnValidate = False
#             except ValueError:
#                 messagebox.showwarning(title='ERROR', message='Invalid input. Please Try again.')
#                 self.ZipInput.delete(0, END)
#                 self.ZipInput.configure(background='Yellow')
#                 blnValidate = False
                
#             return blnValidate
            
#         def Validate_InputFields():
#             """ 
#             Function Name: Validate_InputFields
#             Function Purpose: This function validates the user inputs.
#             """
#             # Declare Local Variables
#             global blnValidate
#             blnValidate = bool(False)

#             # Check the user input
#             blnValidate = Get_FacilityName()
            
#             # Check if the input is valid
#             if (blnValidate is True):
#                 # Check the user input
#                 blnValidate = Get_Address()
                
#                 # Check if the input is valid
#                 if (blnValidate is True):
#                     # Check the user input
#                     blnValidate = Get_State()

#                     # Check if the input is valid
#                     if (blnValidate is True):
#                         # Check the user input
#                         blnValidate = Get_Zip()

#                         # Check if the input is valid
#                         if (blnValidate is True):
#                             blnValidate = True
#                         else:
#                             # Return blnValidate as False
#                             blnValidate = False
#                     else:
#                         # Return blnValidate as False
#                         blnValidate = False
#                 else:
#                     # Return blnValidate as False
#                     blnValidate = False            
#             else:
#                 # Return blnValidate as False
#                 blnValidate = False

#             return blnValidate

#         def Clear_BG_Color():
#             """ 
#             Function Name: Clear_BG_Color
#             Function Purpose: This button executes when the user submits their entries and clears the background
#             color before any validation checks.
#             """
#             # Delete the button after submission
#             self.FacilityNameInput.configure(background='White')
#             self.AddressInput.configure(background='White')
#             self.StateInput.configure(background='White')
#             self.ZipInput.configure(background='White')
#             self.PhoneNumInput.configure(background='White')
            
#         def Reset():
#             """ 
#             Function Name: Reset
#             Function Purpose: This button executes when the user wants to reset the values.
#             """
#             # Delete the button after submission
#             self.FacilityNameInput.delete(0, END)
#             self.AddressInput.delete(0, END)
#             self.StateInput.delete(0, END)
#             self.ZipInput.delete(0, END)
#             self.PhoneNumInput.delete(0, END)
            
#             # Clear out the background colors and set to default as 'white'
#             Clear_BG_Color()

#         def Submit():
#             """ 
#             Function Name: Submit
#             Function Purpose: This button executes when the user wants to sumbit the values to the db. First check
#             if all of the values are valid. If yes, proceed to upload the new unit to the db. Else, reset
#             """
#             # Check if all of the inputs are valid
#             global blnValidate 
#             blnValidate = bool(False)
            
#             # Clear out the background colors and set to default as 'white'
#             Clear_BG_Color()
            
#             # Get the blnValidate status
#             blnValidate = Validate_InputFields()
            
#             # Check if the input is valid
#             if (blnValidate is True):
#                 blnValidate = True
#             else:
#                 # Return blnValidate as False
#                 blnValidate = False
            
#         # Create the submit frame
#         self.submitFrame = LabelFrame(root, text="Submit Entry")
#         self.submitFrame.place(x=5, y=180, width=320, height=50)

#         # Create the buttons
#         self.btnSubmit = Button(self.submitFrame, text="Submit", width=5, command=Submit)
#         self.btnExit = Button(self.submitFrame, text="Exit", width=5)
#         self.btnReset = Button(self.submitFrame, text="Reset", width=5, command=Reset)

#         # Create the button grid
#         self.btnSubmit.grid(row=0, column=0, padx=15)
#         self.btnReset.grid(row=0, column=1, padx=10)
#         self.btnExit.grid(row=0, column=2, padx=10)
        

# class AddLocation(root):
#     """
#     Class Name: AddLocation
#     Class Description: This class adds a New Location to the database.
#     """
#     def __init__(self):    
#         # Create the Window attributes
#         self.WindowTitle = root.title("Add New Location")
#         self.WindowGeo = root.geometry("330x120")
#         self.WindowSize = root.resizable(False, False)

#         # Create the second frame to hold the input fields
#         self.frameInput = LabelFrame(root, text="Location Credentials")
#         self.frameInput.place(x=5, y=5, width=320, height=55)

#         # Create the labels 
#         self.lblLocationName = Label(self.frameInput, text="Location Name:")

#         # Create the label locations
#         self.lblLocationName.grid(row=0, column=0)

#         # Create the entry input box
#         self.LocationInput = Entry(self.frameInput, width=22)

#         # Create the grid for all of the entry input fields
#         self.LocationInput.grid(row=0, column=1)

#         # Get the user inputs
#         self.LocationInput.get()

#         def Get_LocationName():
#             """ 
#             Function Name: Get_LocationName
#             Function Purpose: This function gets the user Location name.
#             """
#             # Declare Local Variables
#             global blnValidate
#             blnValidate = bool(False)
            
#             try:
#                 if self.LocationInput.get() != "":
#                     # Set blnValidated to True
#                     blnValidate = True
#                 else:
#                     messagebox.showwarning(title='ERROR', message=['Input should not be empty. Please Try again.'])
#                     self.LocationInput.delete(0, END)
#                     self.LocationInput.configure(background='Yellow')
#                     blnValidate = False
#             except ValueError:
#                 messagebox.showwarning(title='ERROR', message='Invalid input. Please Try again.')
#                 self.LocationInput.delete(0, END)
#                 self.LocationInput.configure(background='Yellow')
#                 blnValidate = False
                
#             return blnValidate

#         def Clear_BG_Color():
#             """ 
#             Function Name: Clear_BG_Color
#             Function Purpose: This button executes when the user submits their entries and clears the background
#             color before any validation checks.
#             """
#             # Delete the button after submission
#             self.LocationInput.configure(background='White')
            
#         def Reset():
#             """ 
#             Function Name: Reset
#             Function Purpose: This button executes when the user wants to reset the values.
#             """
#             # Delete the button after submission
#             self.LocationInput.delete(0, END)    
            
#             # Clear out the background colors and set to default as 'white'
#             Clear_BG_Color()
            
#         def Submit():
#             """ 
#             Function Name: Submit
#             Function Purpose: This button executes when the user wants to sumbit the values to the db. First check
#             if all of the values are valid. If yes, proceed to upload the new location to the db. Else, reset
#             """
#             # Check if all of the inputs are valid
#             global blnValidate 
#             blnValidate = bool(False)
            
#             # Clear out the background colors and set to default as 'white'
#             Clear_BG_Color()
            
#             # Get the blnValidate status
#             blnValidate = Get_LocationName()
            
#             # Check if the input is valid
#             if (blnValidate is True):
#                 blnValidate = True
#             else:
#                 # Return blnValidate as False
#                 blnValidate = False    
            
#         # Create the submit frame
#         self.submitFrame = LabelFrame(root, text="Submit Entry")
#         self.submitFrame.place(x=5, y=60, width=320, height=50)

#         # Create the buttons
#         self.btnSubmit = Button(self.submitFrame, text="Submit", width=5, command=Submit)
#         self.btnExit = Button(self.submitFrame, text="Exit", width=5)
#         self.btnReset = Button(self.submitFrame, text="Reset", width=5, command=Reset)

#         # Create the button grid
#         self.btnSubmit.grid(row=0, column=0, padx=15)
#         self.btnReset.grid(row=0, column=1, padx=10)
#         self.btnExit.grid(row=0, column=2, padx=10)

                            
# class View_LastNext_InspectDate(FireEx):
#     """
#     Class Name: View_LastNext_InspectDate
#     Class Description: This class views all of the last and next inspection dates and highlights the dates due for
#     immediate or upcoming inspection dates based off the parameters of less than 7 days and or less than 14 days.
#     """
#     def __init__(self):
#         # Create the root tkinter variable
#         self.root = Tk()
        
#         # Create the Window attributes
#         self.WindowTitle = self.root.title("Future Inspections")
#         self.WindowGeo = self.root.geometry("467x350")
#         self.WindowSize = self.root.resizable(False, False)

#         # Create the multi line text field
#         self.frameMSG = LabelFrame(self.root, text="Inspection Message")
#         self.frameMSG.place(x=5, y=0, width=458)

#         # Create the display message for the new inspection
#         self.DisplayMessage = str(
#         """
#         Any unit highlighted in 'Yellow' is due for an inspection within seven 
#         days. If a unit is highlighted in 'Red', the unit might be overdue for
#         an inspection or is less than a week away from next inspection date. 
#         All other units do not require an inspection within seven days. 
#         """)
                
#         # Create the label for the display message
#         self.InstructMessage = Label(self.frameMSG, text=self.DisplayMessage)
#         self.InstructMessage.grid(row=0, column=0, padx=15)
                
#         # Create the second frame to hold the header fields
#         self.headFrame = LabelFrame(self.root, text="Unit Information")
#         self.headFrame.place(x=5, y=125, width=458)

#         # Create the labels
#         self.lblSerialNum = Label(self.headFrame, text="Serial Number", relief="groove", width=16)
#         self.lblLastIn = Label(self.headFrame, text="Last Inspection", relief="groove", width=16)
#         self.lblNextIn = Label(self.headFrame, text="Next Inspection", relief="groove", width=16)

#         # Create the grid
#         self.lblSerialNum.grid(row=0, column=0, padx=1)
#         self.lblLastIn.grid(row=0, column=1)
#         self.lblNextIn.grid(row=0, column=2)

#         # Create the third frame to hold the result fields
#         self.resultFrame = LabelFrame(self.root, text="Results")
#         self.resultFrame.place(x=5, y=170, width=458)

#         # Create the buttons
#         self.btnExit = Button(self.root, text="Exit", width=5)

#         # Create the button grid
#         self.btnExit.place(x=185, y=315)
        
#         self.lst = [[FireEx.astrSerialNum], [FireEx.adtmLastInspectionDate], [FireEx.adtmNextInspectionDate]]
#         # Get the length of the lists
#         self.intRowCount = len(self.lst[0][0])
#         self.intColumnCount = len(self.lst[1][0])

#         # Create timedelta variables to calculate the days remaining
#         self.dtmWARNING_MIN = timedelta(days=7)
#         self.dtmWARNING_MAX = timedelta(days=14)
#         self.dtmMONTH_COUNT = timedelta(days=30)
#         self.dtmToday = datetime.date(datetime.now())
#         self.dtmToday = datetime.strftime(self.dtmToday, '%Y/%m/%d')
#         self.dtmToday = datetime.strptime(str(self.dtmToday), '%Y/%m/%d')

#         # Create the for loop to get the records and highlight any records due for inspection
#         for rowIndex in range(self.intRowCount):
#             for columnIndex in range(self.intColumnCount):
#                 # Create the entry input field
#                 self.Input = Entry(self.resultFrame, width=15)
                    
#                 # Create the grid for the entry value
#                 self.Input.grid(row=rowIndex, column=columnIndex, padx=1.5)
                
#                 # Create a new list holding the values at rowIndex
#                 self.lastDate = datetime.strftime(self.adtmLastInspectionDate[rowIndex], '%Y/%m/%d')
#                 self.nextDate = datetime.strftime(self.adtmNextInspectionDate[rowIndex], '%Y/%m/%d')
#                 self.lastDate = datetime.strptime(self.lastDate, '%Y/%m/%d')
#                 self.nextDate = datetime.strptime(self.nextDate, '%Y/%m/%d')
                                
#                 # Check if the last date is greater than or less than todays day to determine the calucation for days remaining
#                 if (self.nextDate > self.dtmToday):
#                     # Calculate the days remaining 
#                     self.daysRemain = (self.nextDate - self.dtmToday)
                    
#                     # Conditional determing the type of warning 
#                     if (self.daysRemain <= self.dtmWARNING_MIN):
#                         self.Input.configure(background='#ff4e01')            
#                         self.Input.insert(END, self.lst[rowIndex][columnIndex]) 
#                         self.Input.configure(state='readonly')           
#                     elif(self.daysRemain > self.dtmWARNING_MIN) and (self.daysRemain <= self.dtmWARNING_MAX):
#                         self.Input.configure(background='#fefe00')
#                         self.Input.insert(END, self.lst[rowIndex][columnIndex])
#                         self.Input.configure(state='readonly')       
#                     else: 
#                         self.Input.insert(END, self.lst[rowIndex][columnIndex]) 
#                         self.Input.configure(state='readonly')       
#                 else:
#                     # Calculate the days remaining 
#                     self.daysRemain = (self.dtmToday - self.nextDate)
                    
#                     # Conditional determing the type of warning
#                     if (self.daysRemain <= self.dtmWARNING_MIN) or (self.daysRemain > self.dtmMONTH_COUNT):
#                         self.Input.configure(background='#ff4e01')            
#                         self.Input.insert(END, self.lst[rowIndex][columnIndex])   
#                         self.Input.configure(state='readonly')            
#                     elif(self.daysRemain > self.dtmWARNING_MIN) and (self.daysRemain <= self.dtmWARNING_MAX):
#                         self.Input.configure(background='#fefe00')
#                         self.Input.insert(END, self.lst[rowIndex][columnIndex])
#                         self.Input.configure(state='readonly')       
#                     else:           
#                         self.Input.insert(END, self.lst[rowIndex][columnIndex]) 
#                         self.Input.configure(state='readonly')            

#         # Keep the root window open while the user is interacting with the widgets
#         self.root.mainloop()
                
#     def Exit(self):
#         """ 
#         Function Name: Exit
#         Function Purpose: This function is executed once the user clicks on the exit button inside the result
#         frame. If the user clicks 'Exit', the widow is destroyed and the user is sent back to main menu 
#         """         
#         self.root.destroy()
#         Start_Menu()       

# class View_FireEx_Dates(root):
#     """
#     Class Name: View_FireEx_Dates
#     Class Description: This class views all of the Fire Extinguisher Dates
#     """
#     def __init__(self):
#         # Create the Window attributes
#         self.WindowTitle = root.title("Fire Extinguisher Date Information")
#         self.WindowGeo = root.geometry("1055x200")
#         self.WindowSize = root.resizable(False, True)

#         # Create the second frame to hold the header fields
#         self.headFrame = LabelFrame(root, text="Unit Dates")
#         self.headFrame.place(x=5, y=0, width=1060)

#         # Create the labels
#         self.lblSerialNum = Label(self.headFrame, text="Serial Number", relief="groove", width=15)
#         self.lblManuDate = Label(self.headFrame, text="Manufacture Date", relief="groove", width=15)
#         self.lblServiceDate= Label(self.headFrame, text="Service Date", relief="groove", width=15)
#         self.lblReserviceDate = Label(self.headFrame, text="Re-service Date", relief="groove", width=15)
#         self.lblInstallDate = Label(self.headFrame, text="Install Date", relief="groove", width=15)
#         self.lblLastIn = Label(self.headFrame, text="Last Inspection", relief="groove", width=15)
#         self.lblNextIn = Label(self.headFrame, text="Next Inspection", relief="groove", width=15)

#         # Create the grid
#         self.lblSerialNum.grid(row=0, column=0, padx=4)
#         self.lblManuDate.grid(row=0, column=1, padx=4)
#         self.lblServiceDate.grid(row=0, column=2, padx=4)
#         self.lblReserviceDate.grid(row=0, column=3, padx=4)
#         self.lblInstallDate.grid(row=0, column=4, padx=4)
#         self.lblLastIn.grid(row=0, column=5, padx=4)
#         self.lblNextIn.grid(row=0, column=6, padx=4)

#         # Create the second frame to hold the result fields
#         self.resultFrame = LabelFrame(root)
#         self.resultFrame.place(x=5, y=40, width=1060)

#         # Call the sub
#         View_FireEx_Dates.Create_FireExDate_Grid(View_FireEx_Dates, listObj)
        
#     def Create_FireExDate_Grid(self, lst):
#         """ 
#         Function Name: Create_FireExDate_Grid
#         Function Purpose: This function builds a grid for all of the Fire Extinguisher dates.
#         """
#         # Get the length of the lists
#         intRowCount = len(lst)
#         intColumnCount = len(lst[0])
        
#         # Create the for loop to get the records insert the records into the grid
#         for rowIndex in range(intRowCount):
#             for columnIndex in range(intColumnCount):
#                 # Create the entry input field
#                 self.e = Entry(self.resultFrame, width=15)
                    
#                 # Create the grid for the entry value
#                 self.e.grid(row=rowIndex, column=columnIndex, padx=1)
#                 self.e.insert(END, lst[rowIndex][columnIndex])
#                 self.e.configure(state='readonly')
        
                
# class Update_Unit_Info(root):
#     """
#     Class Name: UpdateInfo
#     Class Description: This class updates a limited amount of information for each unit to the db. 
#     """
#     def __init__(self):
#         # Create the Window attributes
#         self.WindowTitle = root.title("Update Unit Credentials")
#         self.WindowGeo = root.geometry("380x310")
#         self.WindowSize = root.resizable(False, False)

#         # Create the second frame to hold the header fields
#         self.frameInput = LabelFrame(root, text="Unit Information")
#         self.frameInput.place(x=5, y=0, width=370)

#         # Create the labels
#         self.lblSerialNum = Label(self.frameInput, text="Serial Number:")
#         self.lblManuDate = Label(self.frameInput, text="Manufacture Date:")
#         self.lblServiceDate= Label(self.frameInput, text="Service Date:")
#         self.lblReserviceDate = Label(self.frameInput, text="Re-service Date:")
#         self.lblInstallDate = Label(self.frameInput, text="Install Date:")
#         self.lblInUseStatus = Label(self.frameInput, text="Device In Use:")

#         # Create the grid
#         self.lblSerialNum.grid(row=0, column=0, padx=4)
#         self.lblManuDate.grid(row=1, column=0, padx=4)
#         self.lblServiceDate.grid(row=2, column=0, padx=4)
#         self.lblReserviceDate.grid(row=3, column=0, padx=4)
#         self.lblInstallDate.grid(row=4, column=0, padx=4)
#         self.lblInUseStatus.grid(row=5, column=0, padx=4)

#         # Create the drop down menu click object
#         self.dropSNL = StringVar()
#         self.dropDIUL = StringVar()

#         # Create the list objects for the attributes
#         self.SerialNumList = ['01278', '01281', 'PD1098', 'I-0098', '01279']
#         self.InUseList = ['No', 'Yes']

#         # Set the list objects first element to the drop click item
#         self.dropSNL.set(self.SerialNumList[0])
#         self.dropDIUL.set(self.InUseList[0])

#         # Create the drop down menut list objects
#         self.dropSerialNum = OptionMenu(self.frameInput,self.dropSNL, *self.SerialNumList)
#         self.dropInUse = OptionMenu(self.frameInput, self.dropDIUL, *self.InUseList)

#         # Create the grid for the drop down menu
#         self.dropSerialNum.grid(row=0, column=1, padx=10)
#         self.dropInUse.grid(row=5, column=1, padx=10)
                                                
#         # Create the entry input box
#         self.ManuDateInput = Entry(self.frameInput, width=25)
#         self.ServiceDateInput = Entry(self.rameInput, width=25)
#         self.ReserviceDateInput = Entry(self.frameInput, width=25)
#         self.InstallDateInput = Entry(self.frameInput, width=25)

#         # Create the grid for all of the entry input fields
#         self.ManuDateInput.grid(row=2, column=1)
#         self.ServiceDateInput.grid(row=3, column=1)
#         self.ReserviceDateInput.grid(row=4, column=1)
#         self.InstallDateInput.grid(row=5, column=1)

#         # Get the user inputs
#         self.ManuDateInput.get()
#         self.ServiceDateInput.get()
#         self.ReserviceDateInput.get()
#         self.InstallDateInput.get()
            
#         def Validate_InputFields(self):
#             """ 
#             Function Name: Validate_InputFields
#             Function Purpose: This function validates the user inputs.
#             """
#             # Declare Local Variables
#             global blnValidate
#             blnValidate = bool(False)

#             # Check the user input
#             blnValidate = Get_ManuDate(self)
            
#             # Check if the input is valid
#             if (blnValidate is True):
#                 # Check the user input
#                 blnValidate = Get_ServiceDate(self)

#                 # Check if the input is valid
#                 if (blnValidate is True):
#                     # Check the user input
#                     blnValidate = Get_ReserviceDate(self)

#                     # Check if the input is valid
#                     if (blnValidate is True):
#                         # Check the user input
#                         blnValidate = Get_InstallDate(self)
                        
#                         # Check if the input is valid
#                         if (blnValidate is True):
#                             blnValidate = True
#                         else:
#                             # Return blnValidate as False
#                             blnValidate = False
#                     else:
#                         # Return blnValidate as False
#                         blnValidate = False
#                 else:
#                     # Return blnValidate as False
#                     blnValidate = False
#             else:
#                 # Return blnValidate as False
#                 blnValidate = False            

#             return blnValidate

#         def Clear_BG_Color(self):
#             """ 
#             Function Name: Clear_BG_Color
#             Function Purpose: This button executes when the user submits their entries and clears the background
#             color before any validation checks.
#             """
#             # Delete the button after submission
#             self.ManuDateInput.configure(background='White')
#             self.ServiceDateInput.configure(background='White')
#             self.ReserviceDateInput.configure(background='White')
#             self.InstallDateInput.configure(background='White')
                        
#         def Reset(self):
#             """ 
#             Function Name: Reset
#             Function Purpose: This button executes when the user wants to reset the values.
#             """
#             # Delete the button after submission
#             self.ManuDateInput.delete(0, END)
#             self.ServiceDateInput.delete(0, END)
#             self.ReserviceDateInput.delete(0, END)
#             self.InstallDateInput.delete(0, END)
            
#             # Reset the drop menus
#             self.dropSNL.set(self.CaseWeightList[0])
#             self.dropDIUL.set(self.InUseList[0])
            
#             # Clear out the background colors and set to default as 'white'
#             Clear_BG_Color()

#         def Submit(self):
#             """ 
#             Function Name: Submit
#             Function Purpose: This button executes when the user wants to sumbit the values to the db. First check
#             if all of the values are valid. If yes, proceed to upload the new FireEx unit to the db. Else, reset
#             """
#             # Check if all of the inputs are valid
#             global blnValidate 
#             blnValidate = bool(False)
            
#             # Clear out the background colors and set to default as 'white'
#             Clear_BG_Color(self)
            
#             # Get the blnValidate status
#             blnValidate = Validate_InputFields(self)
            
#             # Check if the input is valid
#             if (blnValidate is True):
#                 blnValidate = True
#             else:
#                 # Return blnValidate as False
#                 blnValidate = False
            
#         # Create the submit frame
#         self.submitFrame = LabelFrame(root, text="Submit Entry")
#         self.submitFrame.place(x=5, y=180, width=370, height=50)

#         # Create the buttons
#         self.btnSubmit = Button(self.submitFrame, text="Submit", width=5, command=Submit)
#         self.btnExit = Button(self.submitFrame, text="Exit", width=5)
#         self.btnReset = Button(self.submitFrame, text="Reset", width=5, command=Reset)

#         # Create the button grid
#         self.btnSubmit.grid(row=0, column=0, padx=20)
#         self.btnReset.grid(row=0, column=1, padx=20)
#         self.btnExit.grid(row=0, column=2, padx=20)
            
    
# class SendReport():
#     """
#     Class Name: SendReport
#     Class Description: This class accesses the parent dir and sends the report via email to the desired client. 
#     """
#     def __init__(self):
#         # Create the root tkinter variable
#         self.root = Tk()
                
#         # Create the Window attributes
#         self.WindowTitle =  self.root.title("Send Email")
#         self.WindowGeo =  self.root.geometry("390x170")
#         self.WindowSize =  self.root.resizable(False, False)                      

#         # Create the first frame
#         self.frameInput = LabelFrame( self.root, text='Client Credentials')
#         self.frameInput.place(x=5, y=0, width=380)

#         # Create the labes for input
#         self.lblClientEmail = Label(self.frameInput, text='Enter Client Email:')
#         self.lblClientEmailTwo = Label(self.frameInput, text='Re-enter Client Email:')
#         self.lblAttachment = Label(self.frameInput, text='Attachment:')

#         # Create the grid for the labels
#         self.lblClientEmail.grid(row=0, column=0)
#         self.lblClientEmailTwo.grid(row=1, column=0)
#         self.lblAttachment.grid(row=2, column=0)

#         # Create the entry input fields
#         self.getClientEmail = Entry(self.frameInput, width=25)
#         self.getClientEmailTwo = Entry(self.frameInput, width=25)
#         self.getAttachment = Entry(self.frameInput, width=25)

#         # Create the grid for the input fields
#         self.getClientEmail.grid(row=0, column=1)
#         self.getClientEmailTwo.grid(row=1, column=1)
#         self.getAttachment.grid(row=2, column=1)

#         # Get the user inputs
#         self.getClientEmail.get()
#         self.getClientEmailTwo.get()    

#         # Create the submit frame
#         self.submitFrame = LabelFrame(self.root, text="Submit Entry")
#         self.submitFrame.place(x=5, y=110, width=380, height=50)

#         # Create the buttons
#         self.btnSubmit = Button(self.submitFrame, text="Submit", width=5, command=Submit)
#         self.btnExit = Button(self.submitFrame, text="Exit", width=5)
#         self.btnReset = Button(self.submitFrame, text="Reset", width=5, command=Reset)
#         self.btnOpen = Button(self.submitFrame, text='Open', width=5, command=lambda:SQLQueries.Open_XL_File()) 

#         # Create the button grid
#         self.btnSubmit.grid(row=0, column=0, padx=8)
#         self.btnReset.grid(row=0, column=4, padx=6)
#         self.btnExit.grid(row=0, column=3, padx=6)        
#         self.btnOpen.grid(row=0, column=1, padx=6) 
        
#         # Keep the root window open while the user is interacting with the widgets
#         self.root.mainloop()
                                
#         def Get_ClientEmail(self):
#             """ 
#             Function Name: Get_ClientEmail
#             Function Purpose: This function executes when the user enters the first and second client email entry.
#             """
#             # Declare Global Variables
#             global blnValidate
#             blnValidate = bool(False)
            
#             try:
#                 if (self.getClientEmail.get() != "") and (self.getClientEmail.get() == self.getClientEmailTwo.get()):
#                     # Set blnValidated to True
#                     blnValidate = True
#                 elif (self.getClientEmail.get() != "") and (self.getClientEmail.get() != self.getClientEmailTwo.get()):
#                     messagebox.showwarning(title='ERROR', message=['One of the Email inputs did not match the other. Please try again.'])
#                     self.getClientEmail.delete(0, END)
#                     self.getClientEmailTwo.delete(0, END)
#                     self.getClientEmail.configure(background='Yellow')
#                     self.getClientEmailTwo.configure(background='Yellow')
#                     blnValidate = False
#             except ValueError:
#                 messagebox.showwarning(title='ERROR', message='Invalid input. Please Try again.')
#                 self.getClientEmail.delete(0, END)
#                 self.getClientEmailTwo.delete(0, END)
#                 self.getClientEmail.configure(background='Yellow')
#                 self.getClientEmailTwo.configure(background='Yellow')
#                 blnValidate = False
                
#             return blnValidate
                
#         def Clear_BG_Color(self):
#             """ 
#             Function Name: Clear_BG_Color
#             Function Purpose: This button executes when the user submits their entries and clears the background
#             color before any validation checks.
#             """
#             # Delete the button after submission
#             self.getClientEmail.configure(background='White')
#             self.getClientEmailTwo.configure(background='White')
                    
#         def Reset(self):
#             """ 
#             Function Name: Reset
#             Function Purpose: This button executes when the user wants to reset the values.
#             """
#             # Delete the button after submission
#             self.getClientEmail.delete(0, END)
#             self.getClientEmailTwo.delete(0, END)
#             self.getAttachment.delete(0, END)
            
#             # Clear out the background colors and set to default as 'white'
#             Clear_BG_Color(self)

#         def Submit(self):
#             """ 
#             Function Name: Submit
#             Function Purpose: This button executes when the user wants to sumbit the values to the db. First check
#             if all of the values are valid. If yes, proceed to upload the new FireEx unit to the db. Else, reset
#             """
#             # Declare Global Variables
#             global blnValidate 
#             blnValidate = bool(False)
            
#             # Clear out the background colors and set to default as 'white'
#             Clear_BG_Color()
            
#             # Get the blnValidate status
#             blnValidate = Get_ClientEmail(self)
            
#             # Check if the input is valid
#             if (blnValidate is True):
#                 blnValidate = True
#             else:
#                 # Return blnValidate as False
#                 blnValidate = False
            
def Main():
    """ 
    Function Name: Main Start Program
    Function Description: This function begins the program. Get the user input for Assignment One MOD07
    """
    try:
        UserLogin_Main()      

        
    # Display error message if the entry is invalid
    except Exception as err:
        print("Exception occurred because", err) 
                
# This is the start of main program
if __name__ == '__main__':
    Main()            