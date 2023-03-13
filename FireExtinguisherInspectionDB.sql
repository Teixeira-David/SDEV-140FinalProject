-- -------------------------------------------------------------------------------------------------------
-- Project Name: Fire Extinguisher DATABASE
-- Abstract: This is the final project for SDEV-140. This database is to store all of the fire extinguisher
-- inspection data. 
-- Admin: David Teixeira
-- Date: 02/15/2023
-- -------------------------------------------------------------------------------------------------------

-- -------------------------------------------------------------------------------------------------------
-- Options
-- -------------------------------------------------------------------------------------------------------
USE FireExdbMAIN;       -- Get out of the master database
SET NOCOUNT ON;         -- Report only errors
SET XACT_ABORT ON;

-- -------------------------------------------------------------------------------------------------------
--                                              Main Database
-- -------------------------------------------------------------------------------------------------------

-- -------------------------------------------------------------------------------------------------------
-- Drop Tables 
-- -------------------------------------------------------------------------------------------------------
IF OBJECT_ID ( 'TInspectionStatus' )                        IS NOT NULL DROP TABLE TInspectionStatus 
IF OBJECT_ID ( 'THoses' )                                   IS NOT NULL DROP TABLE THoses 
IF OBJECT_ID ( 'TStandardHoseInspections' )                 IS NOT NULL DROP TABLE TStandardHoseInspections 
IF OBJECT_ID ( 'THandles' )                                 IS NOT NULL DROP TABLE THandles 
IF OBJECT_ID ( 'TStandardHandleInspections' )               IS NOT NULL DROP TABLE TStandardHandleInspections
IF OBJECT_ID ( 'TPressGuageTypes' )                         IS NOT NULL DROP TABLE TPressGuageTypes 
IF OBJECT_ID ( 'TPressGuageRanges' )                        IS NOT NULL DROP TABLE TPressGuageRanges 
IF OBJECT_ID ( 'TPressureGuages' )                          IS NOT NULL DROP TABLE TPressureGuages 
IF OBJECT_ID ( 'TStandardPressGuageInspections' )           IS NOT NULL DROP TABLE TStandardPressGuageInspections 
IF OBJECT_ID ( 'TCaseWeights' )                             IS NOT NULL DROP TABLE TCaseWeights 
IF OBJECT_ID ( 'TCaseAgents' )                              IS NOT NULL DROP TABLE TCaseAgents 
IF OBJECT_ID ( 'TCases' )                                   IS NOT NULL DROP TABLE TCases 
IF OBJECT_ID ( 'TStandardCaseInspections' )                 IS NOT NULL DROP TABLE TStandardCaseInspections 
IF OBJECT_ID ( 'THousings' )                                IS NOT NULL DROP TABLE THousings 
IF OBJECT_ID ( 'TStandardHousingInspections' )              IS NOT NULL DROP TABLE TStandardHousingInspections 
IF OBJECT_ID ( 'TStates' )                                  IS NOT NULL DROP TABLE TStates 
IF OBJECT_ID ( 'TInspectors' )                              IS NOT NULL DROP TABLE TInspectors
IF OBJECT_ID ( 'TLogins' )                                  IS NOT NULL DROP TABLE TLogins
IF OBJECT_ID ( 'TUserLogins' )                              IS NOT NULL DROP TABLE TUserLogins
IF OBJECT_ID ( 'TFacilities' )                              IS NOT NULL DROP TABLE TFacilities
IF OBJECT_ID ( 'TFireEx' )                                  IS NOT NULL DROP TABLE TFireEx 
IF OBJECT_ID ( 'TLocations' )                               IS NOT NULL DROP TABLE TLocations 
IF OBJECT_ID ( 'TFireExInspectors' )                        IS NOT NULL DROP TABLE TFireExInspectors
IF OBJECT_ID ( 'TFireExFacilityLocations' )                 IS NOT NULL DROP TABLE TFireExFacilityLocations
IF OBJECT_ID ( 'TFireExLocations' )                         IS NOT NULL DROP TABLE TFireExLocations 
IF OBJECT_ID ( 'TStandardInspections' )                     IS NOT NULL DROP TABLE TStandardInspections
IF OBJECT_ID ( 'TFireExInspections' )                       IS NOT NULL DROP TABLE TFireExInspections

-- -------------------------------------------------------------------------------------------------------
-- Drop Procedures
-- -------------------------------------------------------------------------------------------------------
IF OBJECT_ID ( 'uspAddNewHose' )                            IS NOT NULL DROP PROCEDURE uspAddNewHose
IF OBJECT_ID ( 'uspAddNewStandardHoseInspection' )          IS NOT NULL DROP PROCEDURE uspAddNewStandardHoseInspection
IF OBJECT_ID ( 'uspAddNewHandle' )                          IS NOT NULL DROP PROCEDURE uspAddNewHandle
IF OBJECT_ID ( 'uspAddNewStandardHandleInspection' )        IS NOT NULL DROP PROCEDURE uspAddNewStandardHandleInspection
IF OBJECT_ID ( 'uspAddNewPressureGuage' )                   IS NOT NULL DROP PROCEDURE uspAddNewPressureGuage
IF OBJECT_ID ( 'uspAddNewStandardPressGuagueInspection' )   IS NOT NULL DROP PROCEDURE uspAddNewStandardPressGuagueInspection
IF OBJECT_ID ( 'uspAddNewCase' )                            IS NOT NULL DROP PROCEDURE uspAddNewCase
IF OBJECT_ID ( 'uspAddNewStandardCaseInspection' )          IS NOT NULL DROP PROCEDURE uspAddNewStandardCaseInspection
IF OBJECT_ID ( 'uspAddNewHousing' )                         IS NOT NULL DROP PROCEDURE uspAddNewHousing
IF OBJECT_ID ( 'uspAddNewStandardHousingInspection' )       IS NOT NULL DROP PROCEDURE uspAddNewStandardHousingInspection
IF OBJECT_ID ( 'uspAddNewStandardInspection' )              IS NOT NULL DROP PROCEDURE uspAddNewStandardInspection
IF OBJECT_ID ( 'uspAddNewFireExInspection' )                IS NOT NULL DROP PROCEDURE uspAddNewFireExInspection
IF OBJECT_ID ( 'uspAddNewInspector' )                       IS NOT NULL DROP PROCEDURE uspAddNewInspector 
IF OBJECT_ID ( 'uspAddNewFireExLocation' )                  IS NOT NULL DROP PROCEDURE uspAddNewFireExLocation 
IF OBJECT_ID ( 'uspAddNewFireExFacilityLocation' )          IS NOT NULL DROP PROCEDURE uspAddNewFireExFacilityLocation 
IF OBJECT_ID ( 'uspAddNewFireEx' )                          IS NOT NULL DROP PROCEDURE uspAddNewFireEx
IF OBJECT_ID ( 'uspAddNewFacility' )                        IS NOT NULL DROP PROCEDURE uspAddNewFacility 
IF OBJECT_ID ( 'uspAddNewLocation' )                        IS NOT NULL DROP PROCEDURE uspAddNewLocation
IF OBJECT_ID ( 'uspAddNewState' )                           IS NOT NULL DROP PROCEDURE uspAddNewState
IF OBJECT_ID ( 'uspAddNewLogin' )                           IS NOT NULL DROP PROCEDURE uspAddNewLogin
IF OBJECT_ID ( 'uspAddNewUserLogin' )                       IS NOT NULL DROP PROCEDURE uspAddNewUserLogin 
IF OBJECT_ID ( 'uspUpdateFireExDevice' )                    IS NOT NULL DROP PROCEDURE uspUpdateFireExDevice 
IF OBJECT_ID ( 'uspUpdate_FireEx' )                         IS NOT NULL DROP PROCEDURE uspUpdate_FireEx 
IF OBJECT_ID ( 'uspAddNewFireExLocation' )                  IS NOT NULL DROP PROCEDURE uspAddNewFireExLocation
IF OBJECT_ID ( 'uspAddNewFireExInspector' )                 IS NOT NULL DROP PROCEDURE uspAddNewFireExInspector

-- -------------------------------------------------------------------------------------------------------
-- Drop Z Tables
-- -------------------------------------------------------------------------------------------------------
IF OBJECT_ID ( 'Z_TInspectionStatus' )                      IS NOT NULL DROP TABLE Z_TInspectionStatus 
IF OBJECT_ID ( 'Z_THoses' )                                 IS NOT NULL DROP TABLE Z_THoses 
IF OBJECT_ID ( 'Z_TStandardHoseInspections' )               IS NOT NULL DROP TABLE Z_TStandardHoseInspections 
IF OBJECT_ID ( 'Z_THandles' )                               IS NOT NULL DROP TABLE Z_THandles 
IF OBJECT_ID ( 'Z_TStandardHandleInspections' )             IS NOT NULL DROP TABLE Z_TStandardHandleInspections 
IF OBJECT_ID ( 'Z_TPressGuageTypes' )                       IS NOT NULL DROP TABLE Z_TPressGuageTypes 
IF OBJECT_ID ( 'Z_TPressGuageRanges' )                      IS NOT NULL DROP TABLE Z_TPressGuageRanges 
IF OBJECT_ID ( 'Z_TPressureGuages' )                        IS NOT NULL DROP TABLE Z_TPressureGuages 
IF OBJECT_ID ( 'Z_TStandardPressGuageInspections' )         IS NOT NULL DROP TABLE Z_TStandardPressGuageInspections 
IF OBJECT_ID ( 'Z_TCaseWeights' )                           IS NOT NULL DROP TABLE Z_TCaseWeights 
IF OBJECT_ID ( 'Z_TCaseAgents' )                            IS NOT NULL DROP TABLE Z_TCaseAgents 
IF OBJECT_ID ( 'Z_TCases' )                                 IS NOT NULL DROP TABLE Z_TCases 
IF OBJECT_ID ( 'Z_TStandardCaseInspections' )               IS NOT NULL DROP TABLE Z_TStandardCaseInspections 
IF OBJECT_ID ( 'Z_THousings' )                              IS NOT NULL DROP TABLE Z_THousings 
IF OBJECT_ID ( 'Z_TStandardHousingInspections' )            IS NOT NULL DROP TABLE Z_TStandardHousingInspections 
IF OBJECT_ID ( 'Z_TStates' )                                IS NOT NULL DROP TABLE Z_TStates 
IF OBJECT_ID ( 'Z_TInspectors' )                            IS NOT NULL DROP TABLE Z_TInspectors
IF OBJECT_ID ( 'Z_TLogins' )                                IS NOT NULL DROP TABLE Z_TLogins
IF OBJECT_ID ( 'Z_TUserLogins' )                            IS NOT NULL DROP TABLE Z_TUserLogins
IF OBJECT_ID ( 'Z_TFacilities' )                            IS NOT NULL DROP TABLE Z_TFacilities
IF OBJECT_ID ( 'Z_TFireEx' )                                IS NOT NULL DROP TABLE Z_TFireEx 
IF OBJECT_ID ( 'Z_TLocations' )                             IS NOT NULL DROP TABLE Z_TLocations 
IF OBJECT_ID ( 'Z_TFireExInspectors' )                      IS NOT NULL DROP TABLE Z_TFireExInspectors 
IF OBJECT_ID ( 'Z_TFireExLocations' )                       IS NOT NULL DROP TABLE Z_TFireExLocations 
IF OBJECT_ID ( 'Z_TFireExFacilityLocations' )               IS NOT NULL DROP TABLE Z_TFireExFacilityLocations  
IF OBJECT_ID ( 'Z_TStandardInspections' )                   IS NOT NULL DROP TABLE Z_TStandardInspections
IF OBJECT_ID ( 'Z_TFireExInspections' )                     IS NOT NULL DROP TABLE Z_TFireExInspections

-- -------------------------------------------------------------------------------------------------------
-- Drop Views
-- -------------------------------------------------------------------------------------------------------
IF OBJECT_ID ( 'vInspectors' )                              IS NOT NULL DROP VIEW vInspectors
IF OBJECT_ID ( 'vLogins' )                                  IS NOT NULL DROP VIEW vLogins
IF OBJECT_ID ( 'vInspectStatus' )                           IS NOT NULL DROP VIEW vInspectStatus
IF OBJECT_ID ( 'vHosesLengths' )                            IS NOT NULL DROP VIEW vHosesLengths  
IF OBJECT_ID ( 'vHandlesTypes' )                            IS NOT NULL DROP VIEW vHandlesTypes
IF OBJECT_ID ( 'vPressureGuages' )                          IS NOT NULL DROP VIEW vPressureGuages
IF OBJECT_ID ( 'vCaseComp' )                                IS NOT NULL DROP VIEW vCaseComp
IF OBJECT_ID ( 'vHouseingDesc' )                            IS NOT NULL DROP VIEW vHouseingDesc
IF OBJECT_ID ( 'vFacilityLocations' )                       IS NOT NULL DROP VIEW vFacilityLocations
IF OBJECT_ID ( 'vLocations' )                               IS NOT NULL DROP VIEW vLocations
IF OBJECT_ID ( 'vFireExDates' )                             IS NOT NULL DROP VIEW vFireExDates
IF OBJECT_ID ( 'vFireEx' )                                  IS NOT NULL DROP VIEW vFireEx
IF OBJECT_ID ( 'vFireExInspectors' )                        IS NOT NULL DROP VIEW vFireExInspectors
IF OBJECT_ID ( 'vFireExLocations' )                         IS NOT NULL DROP VIEW vFireExLocations 
IF OBJECT_ID ( 'vFireExFacilityLocation' )                  IS NOT NULL DROP VIEW vFireExFacilityLocation 
IF OBJECT_ID ( 'vFireExInspectDates' )                      IS NOT NULL DROP VIEW vFireExInspectDates
IF OBJECT_ID ( 'vFireExInspectResults' )                    IS NOT NULL DROP VIEW vFireExInspectResults

-- -------------------------------------------------------------------------------------------------------
-- Drop Functions
-- -------------------------------------------------------------------------------------------------------
IF OBJECT_ID ( 'fn_GetInspectionStatus' )                   IS NOT NULL DROP FUNCTION fn_GetInspectionStatus
IF OBJECT_ID ( 'fn_GetHose' )                               IS NOT NULL DROP FUNCTION fn_GetHose
IF OBJECT_ID ( 'fn_GetHandle' )                             IS NOT NULL DROP FUNCTION fn_GetHandle
IF OBJECT_ID ( 'fn_GetPressureType' )                       IS NOT NULL DROP FUNCTION fn_GetPressureType
IF OBJECT_ID ( 'fn_GetPressureRange' )                      IS NOT NULL DROP FUNCTION fn_GetPressureRange
IF OBJECT_ID ( 'fn_GetCaseWeight' )                         IS NOT NULL DROP FUNCTION fn_GetCaseWeight
IF OBJECT_ID ( 'fn_GetCaseAgent' )                          IS NOT NULL DROP FUNCTION fn_GetCaseAgent
IF OBJECT_ID ( 'fn_GetHousingDesc' )                        IS NOT NULL DROP FUNCTION fn_GetHousingDesc
IF OBJECT_ID ( 'fn_GetInspectorName' )                      IS NOT NULL DROP FUNCTION fn_GetInspectorName 
IF OBJECT_ID ( 'fn_GetInspectorEmail' )                     IS NOT NULL DROP FUNCTION fn_GetInspectorEmail 
IF OBJECT_ID ( 'fn_GetUserLoginName' )                      IS NOT NULL DROP FUNCTION fn_GetUserLoginName 
IF OBJECT_ID ( 'fn_GetUserPassword' )                       IS NOT NULL DROP FUNCTION fn_GetUserPassword  
IF OBJECT_ID ( 'fn_GetState' )                              IS NOT NULL DROP FUNCTION fn_GetState  
IF OBJECT_ID ( 'fn_GetFacilityName' )                       IS NOT NULL DROP FUNCTION fn_GetFacilityName
IF OBJECT_ID ( 'fn_GetFacilityAddress' )                    IS NOT NULL DROP FUNCTION fn_GetFacilityAddress
IF OBJECT_ID ( 'fn_GetFacilityZip' )                        IS NOT NULL DROP FUNCTION fn_GetFacilityZip
IF OBJECT_ID ( 'fn_GetFacilityPhoneNum' )                   IS NOT NULL DROP FUNCTION fn_GetFacilityPhoneNum
IF OBJECT_ID ( 'fn_GetLocationName' )                       IS NOT NULL DROP FUNCTION fn_GetLocationName
IF OBJECT_ID ( 'fn_GetFireExSerialNum' )                    IS NOT NULL DROP FUNCTION fn_GetFireExSerialNum
IF OBJECT_ID ( 'fn_GetFireExManuDate' )                     IS NOT NULL DROP FUNCTION fn_GetFireExManuDate
IF OBJECT_ID ( 'fn_GetFireExServiceDate' )                  IS NOT NULL DROP FUNCTION fn_GetFireExServiceDate
IF OBJECT_ID ( 'fn_GetFireExReserviceDate' )                IS NOT NULL DROP FUNCTION fn_GetFireExReserviceDate
IF OBJECT_ID ( 'fn_GetFireExInstallDate' )                  IS NOT NULL DROP FUNCTION fn_GetFireExInstallDate
IF OBJECT_ID ( 'fn_GetFireExLastInspectDate' )              IS NOT NULL DROP FUNCTION fn_GetFireExLastInspectDate
IF OBJECT_ID ( 'fn_GetFireExNextInspectDate' )              IS NOT NULL DROP FUNCTION fn_GetFireExNextInspectDate
IF OBJECT_ID ( 'fn_GetFireExDeviceInUseStatus' )            IS NOT NULL DROP FUNCTION fn_GetFireExDeviceInUseStatus

-- -------------------------------------------------------------------------------------------------------
-- Create Inspection Status Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE TInspectionStatus
(
    intInspectionStatusID                           INTEGER                 NOT NULL  
    ,strInspectionStatusDesc                        VARCHAR(255)            NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT TInspectionStatus_PK PRIMARY KEY (intInspectionStatusID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Inspection Status Audit Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_TInspectionStatus
(
    intInspectionStatusAuditID                      INTEGER IDENTITY        NOT NULL
    ,intInspectionStatusID                          INTEGER                 NOT NULL
    ,strInspectionStatusDesc                        VARCHAR(255)            NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_TInspectionStatus_PK PRIMARY KEY (intInspectionStatusAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: Inspection Status Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTISTriggerAuditRecord ON TInspectionStatus
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time

        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_TInspectionStatus (intInspectionStatusID, strInspectionStatusDesc, strUpdatedBy,
                    dtmUpdatedOn, strAction, strModifiedReason)
                SELECT I.intInspectionStatusID, I.strInspectionStatusDesc, 
                    SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN TInspectionStatus TIS ON TIS.intInspectionStatusID = I.intInspectionStatusID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_TInspectionStatus (intInspectionStatusID, strInspectionStatusDesc, strUpdatedBy,
                        dtmUpdatedOn, strAction, strModifiedReason)
                    SELECT D.intInspectionStatusID, D.strInspectionStatusDesc, 
                        SUSER_SNAME(), GETDATE(), @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, TInspectionStatus TIS 
                    WHERE I.intInspectionStatusID = TIS.intInspectionStatusID AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_TInspectionStatus (intInspectionStatusID, strInspectionStatusDesc, strUpdatedBy,
                                dtmUpdatedOn, strAction, strModifiedReason)
                            SELECT I.intInspectionStatusID, I.strInspectionStatusDesc, 
                                SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                            FROM TInspectionStatus TIS
                                INNER JOIN INSERTED I ON TIS.intInspectionStatusID = I.intInspectionStatusID
                            -- Set modified reason column back to ''
                            UPDATE TInspectionStatus SET strModifiedReason = NULL
                            WHERE intInspectionStatusID IN (SELECT TOP 1 intInspectionStatusID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Create Hose Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE THoses
(
    intHoseID                                       INTEGER                 NOT NULL
    ,strHoseLength                                  VARCHAR(225)            NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT THoses_PK PRIMARY KEY (intHoseID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Hose Audit Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_THoses
(
    intHoseAuditID                                  INTEGER IDENTITY        NOT NULL
    ,intHoseID                                      INTEGER                 NOT NULL
    ,strHoseLength                                  VARCHAR(225)            NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_THoses_PK PRIMARY KEY (intHoseAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: Hose Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTHTriggerAuditRecord ON THoses
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_THoses (intHoseID, strHoseLength, strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                SELECT I.intHoseID, I.strHoseLength, SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN THoses TH ON TH.intHoseID = I.intHoseID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_THoses (intHoseID, strHoseLength, strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                    SELECT D.intHoseID, D.strHoseLength, SUSER_SNAME(), GETDATE(), @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, THoses TH
                    WHERE I.intHoseID = TH.intHoseID AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_THoses (intHoseID, strHoseLength, strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                            SELECT I.intHoseID, I.strHoseLength, SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                            FROM THoses TH
                                INNER JOIN INSERTED I ON TH.intHoseID = I.intHoseID
                            -- Set modified reason column back to ''
                            UPDATE THoses SET strModifiedReason = NULL
                            WHERE intHoseID IN (SELECT TOP 1 intHoseID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                            END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Create Standard Hose Inspection Protocol Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE TStandardHoseInspections
(
    intStandardHoseInspectionID                     INTEGER                 NOT NULL
    ,intHoseID                                      INTEGER                 NOT NULL
    ,intInspectionStatusID                          INTEGER                 NOT NULL
    ,strModifiedReason                              VARCHAR(1000)
    
    ,CONSTRAINT TStandardHoseInspections_PK PRIMARY KEY (intStandardHoseInspectionID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Standard Hose Inspection Protocol Audit Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_TStandardHoseInspections
(
    intStandardHoseInspectionAuditID                INTEGER IDENTITY        NOT NULL
    ,intStandardHoseInspectionID                    INTEGER                 NOT NULL
    ,intHoseID                                      INTEGER                 NOT NULL
    ,intInspectionStatusID                          INTEGER                 NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_TStandardHoseInspections_PK PRIMARY KEY (intStandardHoseInspectionAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: Standard Hose Inspection Protocol Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTSHITriggerAuditRecord ON TStandardHoseInspections
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_TStandardHoseInspections (intStandardHoseInspectionID, intHoseID, intInspectionStatusID, 
                    strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                SELECT I.intStandardHoseInspectionID, I.intHoseID, I.intInspectionStatusID, SUSER_SNAME(), GETDATE(), 
                    @Action, I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN TStandardHoseInspections TSHI ON 
                        TSHI.intStandardHoseInspectionID = I.intStandardHoseInspectionID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_TStandardHoseInspections (intStandardHoseInspectionID, intHoseID, intInspectionStatusID, 
                        strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                    SELECT D.intStandardHoseInspectionID, D.intHoseID, D.intInspectionStatusID, SUSER_SNAME(), GETDATE(), 
                        @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, TStandardHoseInspections TSHI
                    WHERE I.intStandardHoseInspectionID = TSHI.intStandardHoseInspectionID AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_TStandardHoseInspections (intStandardHoseInspectionID, intHoseID, intInspectionStatusID, 
                                strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                            SELECT I.intStandardHoseInspectionID, I.intHoseID, I.intInspectionStatusID, SUSER_SNAME(), GETDATE(), 
                                @Action, I.strModifiedReason
                            FROM TStandardHoseInspections TSHI
                                INNER JOIN INSERTED I ON 
                                    TSHI.intStandardHoseInspectionID = I.intStandardHoseInspectionID
                            -- Set modified reason column back to ''
                            UPDATE TStandardHoseInspections SET strModifiedReason = NULL
                            WHERE intStandardHoseInspectionID IN 
                                (SELECT TOP 1 intStandardHoseInspectionID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Establish Referencial Integrity - Inserts
-- -------------------------------------------------------------------------------------------------------

-- #           Child                           Parent                              Column
-- --         -------                         --------                            --------
-- 1. TStandardHoseInspections              THoses                              intHoseID
-- 2. TStandardHoseInspections              TInspectionStatus                   intInspectionStatusID

-- -------------------------------------------------------------------------------------------------------
-- Create Foreign Keys
-- -------------------------------------------------------------------------------------------------------
-- 1. 
ALTER TABLE TStandardHoseInspections ADD CONSTRAINT TStandardHoseInspections_THoses_FK
FOREIGN KEY ( intHoseID ) REFERENCES THoses ( intHoseID )

-- 2. 
ALTER TABLE TStandardHoseInspections ADD CONSTRAINT TStandardHoseInspections_TInspectionStatus_FK
FOREIGN KEY ( intInspectionStatusID ) REFERENCES TInspectionStatus ( intInspectionStatusID )

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: InspectionStatus
-- -------------------------------------------------------------------------------------------------------
INSERT INTO TInspectionStatus (intInspectionStatusID, strInspectionStatusDesc)
VALUES   (1, 'Good')
        ,(2, 'Monitor')
        ,(3, 'Fail')
        ,(4, 'Replaced')

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: Hose Component
-- -------------------------------------------------------------------------------------------------------
INSERT INTO THoses (intHoseID, strHoseLength)
VALUES   (1, '1ft')
        ,(2, '1.5ft')
        ,(3, '2ft')
        ,(4, '2.5ft')
        ,(5, '3ft')

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: Standard Hose Inspection
-- -------------------------------------------------------------------------------------------------------
INSERT INTO TStandardHoseInspections (intStandardHoseInspectionID, intHoseID, intInspectionStatusID)
VALUES   (1, 1, 1)
        ,(2, 2, 1)
        ,(3, 3, 2)
        ,(4, 4, 3) 
        ,(5, 5, 4) 

-- -------------------------------------------------------------------------------------------------------
-- Create Handle Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE THandles
(
    intHandleID                                     INTEGER                 NOT NULL
    ,strHandleType                                  VARCHAR(255)            NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT THandles_PK PRIMARY KEY (intHandleID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Handle Audit Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_THandles
(
    intHandleAuditID                                INTEGER IDENTITY        NOT NULL
    ,intHandleID                                    INTEGER                 NOT NULL
    ,strHandleType                                  VARCHAR(255)            NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_THandles_PK PRIMARY KEY (intHandleAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: Handles Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTHDLTriggerAuditRecord ON THandles
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_THandles (intHandleID, strHandleType, strUpdatedBy, dtmUpdatedOn, 
                    strAction, strModifiedReason)
                SELECT I.intHandleID, I.strHandleType, SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN THandles THDL ON THDL.intHandleID = I.intHandleID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_THandles (intHandleID, strHandleType, strUpdatedBy, dtmUpdatedOn, 
                        strAction, strModifiedReason)
                    SELECT D.intHandleID, D.strHandleType, SUSER_SNAME(), GETDATE(), @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, THandles THDL
                    WHERE I.intHandleID = THDL.intHandleID AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_THandles (intHandleID, strHandleType, strUpdatedBy, dtmUpdatedOn, 
                                strAction, strModifiedReason)
                            SELECT I.intHandleID, I.strHandleType, SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                            FROM THandles THDL
                                INNER JOIN INSERTED I ON THDL.intHandleID = I.intHandleID
                            -- Set modified reason column back to ''
                            UPDATE THandles SET strModifiedReason = NULL
                            WHERE intHandleID IN (SELECT TOP 1 intHandleID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Create Standard Handle Inspection Protocol Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE TStandardHandleInspections
(
    intStandardHandleInspectionID                   INTEGER                NOT NULL
    ,intHandleID                                    INTEGER                NOT NULL
    ,intInspectionStatusID                          INTEGER                NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT TStandardHandleInspections_PK PRIMARY KEY (intStandardHandleInspectionID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Standard Handle Inspection Protocol Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_TStandardHandleInspections
(
    intStandardHandleInspectionAuditID              INTEGER IDENTITY        NOT NULL
    ,intStandardHandleInspectionID                  INTEGER                 NOT NULL
    ,intHandleID                                    INTEGER                 NOT NULL
    ,intInspectionStatusID                          INTEGER                 NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_TStandardHandleInspections_PK PRIMARY KEY (intStandardHandleInspectionAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: Standard Handle Inspection Protocol Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTSHDLITriggerAuditRecord ON TStandardHandleInspections
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_TStandardHandleInspections (intStandardHandleInspectionID, intHandleID, intInspectionStatusID, 
                    strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                SELECT I.intStandardHandleInspectionID, I.intHandleID, I.intInspectionStatusID, SUSER_SNAME(), 
                    GETDATE(), @Action, I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN TStandardHandleInspections TSHDLI ON 
                        TSHDLI.intStandardHandleInspectionID = I.intStandardHandleInspectionID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_TStandardHandleInspections (intStandardHandleInspectionID, intHandleID, intInspectionStatusID, 
                        strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                    SELECT D.intStandardHandleInspectionID, D.intHandleID, D.intInspectionStatusID, SUSER_SNAME(), 
                        GETDATE(), @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, TStandardHandleInspections TSHDLI
                    WHERE I.intStandardHandleInspectionID = TSHDLI.intStandardHandleInspectionID AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_TStandardHandleInspections (intStandardHandleInspectionID, intHandleID, 
                                intInspectionStatusID, strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                            SELECT I.intStandardHandleInspectionID, I.intHandleID, I.intInspectionStatusID, SUSER_SNAME(), 
                                GETDATE(), @Action, I.strModifiedReason
                            FROM TStandardHandleInspections TSHDLI
                                INNER JOIN INSERTED I ON 
                                    TSHDLI.intStandardHandleInspectionID = I.intStandardHandleInspectionID
                            -- Set modified reason column back to ''
                            UPDATE TStandardHandleInspections SET strModifiedReason = NULL
                            WHERE intStandardHandleInspectionID IN 
                                (SELECT TOP 1 intStandardHandleInspectionID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Establish Referencial Integrity - Inserts
-- -------------------------------------------------------------------------------------------------------

-- #           Child                           Parent                              Column
-- --         -------                         --------                            --------
-- 1. TStandardHandleInspections            THandles                            intHandleID
-- 2. TStandardHandleInspections            TInspectionStatus                   intInspectionStatusID

-- -------------------------------------------------------------------------------------------------------
-- Create Foreign Keys
-- -------------------------------------------------------------------------------------------------------
-- 1. 
ALTER TABLE TStandardHandleInspections ADD CONSTRAINT TStandardHandleInspections_THandles_FK
FOREIGN KEY ( intHandleID ) REFERENCES THandles ( intHandleID )

-- 2. 
ALTER TABLE TStandardHandleInspections ADD CONSTRAINT TStandardHandleInspections_TInspectionStatus_FK
FOREIGN KEY ( intInspectionStatusID ) REFERENCES TInspectionStatus ( intInspectionStatusID )

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: Handle
-- -------------------------------------------------------------------------------------------------------
INSERT INTO THandles (intHandleID, strHandleType)
VALUES   (1, 'Lever Handle')
        ,(2, 'Grip Handle')
        ,(3, 'Rotation Handle')

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: Standard Device Handle Inspection
-- -------------------------------------------------------------------------------------------------------
INSERT INTO TStandardHandleInspections (intStandardHandleInspectionID, intHandleID, intInspectionStatusID)
VALUES   (1, 1, 1)
        ,(2, 2, 1)
        ,(3, 2, 2)
        ,(4, 3, 3) 
        ,(5, 1, 4) 

-- -------------------------------------------------------------------------------------------------------
-- Create Pressure Guage Types Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE TPressGuageTypes
(
    intPressGuageTypeID                             INTEGER                 NOT NULL
    ,strPressureType                                VARCHAR(225)            NOT NULL           
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT TPressGuageTypes_PK PRIMARY KEY (intPressGuageTypeID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Pressure Guage Types Audit Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_TPressGuageTypes
(
    intPressGuageTypeAuditID                        INTEGER IDENTITY        NOT NULL
    ,intPressGuageTypeID                            INTEGER                 NOT NULL
    ,strPressureType                                VARCHAR(225)            NOT NULL  
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_TPressGuageTypes_PK PRIMARY KEY (intPressGuageTypeAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: Pressure Guage Types Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTPGTTriggerAuditRecord ON TPressGuageTypes
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME   
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_TPressGuageTypes (intPressGuageTypeID, strPressureType, strUpdatedBy, 
                    dtmUpdatedOn, strAction, strModifiedReason)
                SELECT I.intPressGuageTypeID, I.strPressureType, SUSER_SNAME(), GETDATE(), @Action, 
                    I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN TPressGuageTypes TPTG ON TPTG.intPressGuageTypeID = I.intPressGuageTypeID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_TPressGuageTypes (intPressGuageTypeID, strPressureType, strUpdatedBy, 
                        dtmUpdatedOn, strAction, strModifiedReason)
                    SELECT D.intPressGuageTypeID, D.strPressureType, SUSER_SNAME(), GETDATE(), @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, TPressGuageTypes TPTG
                    WHERE I.intPressGuageTypeID = TPTG.intPressGuageTypeID AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_TPressGuageTypes (intPressGuageTypeID, strPressureType, strUpdatedBy, 
                                dtmUpdatedOn, strAction, strModifiedReason)
                            SELECT I.intPressGuageTypeID, I.strPressureType, SUSER_SNAME(), GETDATE(), @Action, 
                                I.strModifiedReason
                            FROM TPressGuageTypes TPTG
                                INNER JOIN INSERTED I ON TPTG.intPressGuageTypeID = I.intPressGuageTypeID
                            -- Set modified reason column back to ''
                            UPDATE TPressGuageTypes SET strModifiedReason = NULL
                            WHERE intPressGuageTypeID IN (SELECT TOP 1 intPressGuageTypeID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Create Pressure Guage Ranges Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE TPressGuageRanges
(
    intPressGuageRangeID                            INTEGER                 NOT NULL        
    ,strPressureRange                               VARCHAR(225)            NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT TPressGuageRanges_PK PRIMARY KEY (intPressGuageRangeID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Pressure Guage Ranges Audit Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_TPressGuageRanges
(
    intPressGuageRangeAuditID                       INTEGER IDENTITY        NOT NULL
    ,intPressGuageRangeID                           INTEGER                 NOT NULL        
    ,strPressureRange                               VARCHAR(225)            NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_TPressGuageRanges_PK PRIMARY KEY (intPressGuageRangeAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: Pressure Guage Ranges Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTPGRTriggerAuditRecord ON TPressGuageRanges
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME   
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_TPressGuageRanges (intPressGuageRangeID, strPressureRange, strUpdatedBy, 
                    dtmUpdatedOn, strAction, strModifiedReason)
                SELECT I.intPressGuageRangeID, I.strPressureRange, SUSER_SNAME(), GETDATE(), @Action, 
                    I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN TPressGuageRanges TPGR ON TPGR.intPressGuageRangeID = I.intPressGuageRangeID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_TPressGuageRanges (intPressGuageRangeID, strPressureRange, strUpdatedBy, 
                        dtmUpdatedOn, strAction, strModifiedReason)
                    SELECT D.intPressGuageRangeID, D.strPressureRange, SUSER_SNAME(), GETDATE(), @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, TPressGuageRanges TPGR
                    WHERE I.intPressGuageRangeID = TPGR.intPressGuageRangeID AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_TPressGuageRanges (intPressGuageRangeID, strPressureRange, strUpdatedBy, 
                                dtmUpdatedOn, strAction, strModifiedReason)
                            SELECT I.intPressGuageRangeID, I.strPressureRange, SUSER_SNAME(), GETDATE(), @Action, 
                                I.strModifiedReason
                            FROM TPressGuageRanges TPGR
                                INNER JOIN INSERTED I ON TPGR.intPressGuageRangeID = I.intPressGuageRangeID
                            -- Set modified reason column back to ''
                            UPDATE TPressGuageRanges SET strModifiedReason = NULL
                            WHERE intPressGuageRangeID IN (SELECT TOP 1 intPressGuageRangeID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Create Pressure Guage Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE TPressureGuages
(
    intPressGuageID                                 INTEGER                 NOT NULL
    ,intPressGuageTypeID                            INTEGER                 NOT NULL  
    ,intPressGuageRangeID                           INTEGER                 NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT TPressureGuage_PK PRIMARY KEY (intPressGuageID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Pressure Guage Audit Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_TPressureGuages
(
    intPressGuageAuditID                            INTEGER IDENTITY        NOT NULL
    ,intPressGuageID                                INTEGER                 NOT NULL
    ,intPressGuageTypeID                            INTEGER                 NOT NULL  
    ,intPressGuageRangeID                           INTEGER                 NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_TPressureGuages_PK PRIMARY KEY (intPressGuageAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: Pressure Guage Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTPGTriggerAuditRecord ON TPressureGuages
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME   
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_TPressureGuages (intPressGuageID, intPressGuageTypeID, intPressGuageRangeID, strUpdatedBy, 
                    dtmUpdatedOn, strAction, strModifiedReason)
                SELECT I.intPressGuageID, I.intPressGuageTypeID, I.intPressGuageRangeID, SUSER_SNAME(), GETDATE(), @Action, 
                    I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN TPressureGuages TPG ON TPG.intPressGuageID = I.intPressGuageID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_TPressureGuages (intPressGuageID, intPressGuageTypeID, intPressGuageRangeID, strUpdatedBy, 
                        dtmUpdatedOn, strAction, strModifiedReason)
                    SELECT D.intPressGuageID, D.intPressGuageTypeID, D.intPressGuageRangeID, SUSER_SNAME(), GETDATE(), @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, TPressureGuages TPG
                    WHERE I.intPressGuageID = TPG.intPressGuageID AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_TPressureGuages (intPressGuageID, intPressGuageTypeID, intPressGuageRangeID, 
                                strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                            SELECT I.intPressGuageID, I.intPressGuageTypeID, I.intPressGuageRangeID, SUSER_SNAME(), GETDATE(), @Action, 
                                I.strModifiedReason
                            FROM TPressureGuages TPG
                                INNER JOIN INSERTED I ON TPG.intPressGuageID = I.intPressGuageID
                            -- Set modified reason column back to ''
                            UPDATE TPressureGuages SET strModifiedReason = NULL
                            WHERE intPressGuageID IN (SELECT TOP 1 intPressGuageID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Create Standard Pressure Guage Inspection Protocol Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE TStandardPressGuageInspections
(
    intStandardPressGuageInspectionID               INTEGER                 NOT NULL
    ,intPressGuageID                                INTEGER                 NOT NULL
    ,intInspectionStatusID                          INTEGER                 NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT TStandardPressGuageInspections_PK PRIMARY KEY (intStandardPressGuageInspectionID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Standard Pressure Guage Inspection Protocol Audit Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_TStandardPressGuageInspections
(
    intStandardPressGuageInspectionAuditID          INTEGER IDENTITY        NOT NULL
    ,intStandardPressGuageInspectionID              INTEGER                 NOT NULL
    ,intPressGuageID                                INTEGER                 NOT NULL
    ,intInspectionStatusID                          INTEGER                 NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_TStandardPressGuageInspections_PK PRIMARY KEY (intStandardPressGuageInspectionAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: Standard Pressure Guage Inspection Protocol Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTSPGITriggerAuditRecord ON TStandardPressGuageInspections
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_TStandardPressGuageInspections (intStandardPressGuageInspectionID, intPressGuageID, 
                    intInspectionStatusID, strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                SELECT I.intStandardPressGuageInspectionID, I.intPressGuageID, I.intInspectionStatusID, SUSER_SNAME(), 
                    GETDATE(), @Action, I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN TStandardPressGuageInspections TSPGI ON 
                        TSPGI.intStandardPressGuageInspectionID = I.intStandardPressGuageInspectionID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_TStandardPressGuageInspections (intStandardPressGuageInspectionID, intPressGuageID, 
                        intInspectionStatusID, strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                    SELECT D.intStandardPressGuageInspectionID, D.intPressGuageID, D.intInspectionStatusID, SUSER_SNAME(), 
                        GETDATE(), @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, TStandardPressGuageInspections TSPGI
                        WHERE I.intStandardPressGuageInspectionID = TSPGI.intStandardPressGuageInspectionID 
                            AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_TStandardPressGuageInspections (intStandardPressGuageInspectionID, intPressGuageID, 
                                intInspectionStatusID, strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                            SELECT I.intStandardPressGuageInspectionID, I.intPressGuageID, I.intInspectionStatusID, 
                                SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                            FROM TStandardPressGuageInspections TSPGI
                                INNER JOIN INSERTED I ON 
                                    TSPGI.intStandardPressGuageInspectionID = I.intStandardPressGuageInspectionID
                            -- Set modified reason column back to ''
                            UPDATE TStandardPressGuageInspections SET strModifiedReason = NULL
                            WHERE intStandardPressGuageInspectionID IN 
                                (SELECT TOP 1 intStandardPressGuageInspectionID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Establish Referencial Integrity - Inserts
-- -------------------------------------------------------------------------------------------------------

-- #           Child                           Parent                              Column
-- --         -------                         --------                            --------
-- 1. TPressureGuages                         TPressGuageTypes                    intPressGuageTypeID
-- 2. TPressureGuages                         TPressGuageRanges                   intPressGuageRandeID
-- 3. TStandardPressGuageInspections          TPressureGuages                     intPressGuageID
-- 4. TStandardPressGuageInspections          TInspectionStatus                   intInspectionStatusID

-- -------------------------------------------------------------------------------------------------------
-- Create Foreign Keys
-- -------------------------------------------------------------------------------------------------------
-- 1. 
ALTER TABLE TPressureGuages ADD CONSTRAINT TPressureGuages_TPressGuageTypes_FK
FOREIGN KEY ( intPressGuageTypeID ) REFERENCES TPressGuageTypes ( intPressGuageTypeID )

-- 2. 
ALTER TABLE TPressureGuages ADD CONSTRAINT TPressureGuages_TPressGuageRanges_FK
FOREIGN KEY ( intPressGuageRangeID ) REFERENCES TPressGuageRanges ( intPressGuageRangeID )

-- 3. 
ALTER TABLE TStandardPressGuageInspections ADD CONSTRAINT TStandardPressGuageInspections_TPressureGuages_FK
FOREIGN KEY ( intPressGuageID ) REFERENCES TPressureGuages ( intPressGuageID )

-- 4. 
ALTER TABLE TStandardPressGuageInspections ADD CONSTRAINT TStandardPressGuageInspections_TInspectionStatus_FK
FOREIGN KEY ( intInspectionStatusID ) REFERENCES TInspectionStatus ( intInspectionStatusID )

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: Pressure Guage Types
-- -------------------------------------------------------------------------------------------------------
INSERT INTO TPressGuageTypes (intPressGuageTypeID, strPressureType)
VALUES   (1, 'Stored')
        ,(2, 'Transfer')
        ,(3, 'Regulated')

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: Pressure Guage Ranges
-- -------------------------------------------------------------------------------------------------------
INSERT INTO TPressGuageRanges (intPressGuageRangeID, strPressureRange)
VALUES   (1, '0psi')
        ,(2, '195psi')
        ,(3, '400psi')

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: Pressure Guage
-- -------------------------------------------------------------------------------------------------------
INSERT INTO TPressureGuages (intPressGuageID, intPressGuageTypeID, intPressGuageRangeID)
VALUES   (1, 1, 2)
        ,(2, 1, 2)
        ,(3, 1, 3)
        ,(4, 2, 1)
        ,(5, 2, 2)
        ,(6, 2, 3)
        ,(7, 3, 1)
        ,(8, 3, 2)
        ,(9, 3, 3)

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: Standard Pressure Guage Inspection
-- -------------------------------------------------------------------------------------------------------
INSERT INTO TStandardPressGuageInspections (intStandardPressGuageInspectionID, intPressGuageID, intInspectionStatusID)
VALUES   (1, 1, 2)
        ,(2, 2, 1)
        ,(3, 3, 1)
        ,(4, 8, 1) 
        ,(5, 9, 3) 

-- -------------------------------------------------------------------------------------------------------
-- Create Case Weight Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE TCaseWeights
(
    intCaseWeightID                                 INTEGER                 NOT NULL
    ,strCaseWeight                                  VARCHAR(225)            NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT TCaseWeightst_PK PRIMARY KEY (intCaseWeightID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Case Weight Audit Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_TCaseWeights
(
    intCaseWeightAuditID                            INTEGER IDENTITY        NOT NULL
    ,intCaseWeightID                                INTEGER                 NOT NULL
    ,strCaseWeight                                  VARCHAR(225)            NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_TCaseWeights_PK PRIMARY KEY (intCaseWeightAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: Case Weight Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTCWTriggerAuditRecord ON TCaseWeights
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME   
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_TCaseWeights (intCaseWeightID, strCaseWeight, strUpdatedBy, dtmUpdatedOn, strAction, 
                    strModifiedReason)
                SELECT I.intCaseWeightID, I.strCaseWeight, SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN TCaseWeights TCW ON TCW.intCaseWeightID = I.intCaseWeightID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_TCaseWeights (intCaseWeightID, strCaseWeight, strUpdatedBy, dtmUpdatedOn, strAction, 
                        strModifiedReason)
                    SELECT D.intCaseWeightID, D.strCaseWeight, SUSER_SNAME(), GETDATE(), @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, TCaseWeights TCW 
                    WHERE I.intCaseWeightID = TCW.intCaseWeightID AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_TCaseWeights (intCaseWeightID, strCaseWeight, strUpdatedBy, dtmUpdatedOn, 
                                strAction, strModifiedReason)
                            SELECT I.intCaseWeightID, I.strCaseWeight, SUSER_SNAME(), GETDATE(), @Action, 
                                I.strModifiedReason
                            FROM TCaseWeights TCW 
                                INNER JOIN INSERTED I ON TCW.intCaseWeightID = I.intCaseWeightID
                            -- Set modified reason column back to ''
                            UPDATE TCaseWeights SET strModifiedReason = NULL
                            WHERE intCaseWeightID IN (SELECT TOP 1 intCaseWeightID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Create Case Agent Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE TCaseAgents
(
    intCaseAgentID                                  INTEGER                 NOT NULL
    ,strCaseAgents                                  VARCHAR(225)            NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT TCaseAgents_PK PRIMARY KEY (intCaseAgentID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Case Agent Audit Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_TCaseAgents
(
    intCaseAgentAuditID                             INTEGER IDENTITY        NOT NULL
    ,intCaseAgentID                                 INTEGER                 NOT NULL
    ,strCaseAgents                                  VARCHAR(225)            NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_TCaseAgents_PK PRIMARY KEY (intCaseAgentAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: Case Agent Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTCATriggerAuditRecord ON TCaseAgents
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME   
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_TCaseAgents (intCaseAgentID, strCaseAgents, strUpdatedBy, dtmUpdatedOn, strAction, 
                    strModifiedReason)
                SELECT I.intCaseAgentID, I.strCaseAgents, SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN TCaseAgents TCA ON TCA.intCaseAgentID = I.intCaseAgentID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_TCaseAgents (intCaseAgentID, strCaseAgents, strUpdatedBy, dtmUpdatedOn, strAction, 
                        strModifiedReason)
                    SELECT D.intCaseAgentID, D.strCaseAgents, SUSER_SNAME(), GETDATE(), @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, TCaseAgents TCA 
                    WHERE I.intCaseAgentID = TCA.intCaseAgentID AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_TCaseAgents (intCaseAgentID, strCaseAgents, strUpdatedBy, dtmUpdatedOn, 
                                strAction, strModifiedReason)
                            SELECT I.intCaseAgentID, I.strCaseAgents, SUSER_SNAME(), GETDATE(), @Action, 
                                I.strModifiedReason
                            FROM TCaseAgents TCA 
                                INNER JOIN INSERTED I ON TCA.intCaseAgentID = I.intCaseAgentID
                            -- Set modified reason column back to ''
                            UPDATE TCaseAgents SET strModifiedReason = NULL
                            WHERE intCaseAgentID IN (SELECT TOP 1 intCaseAgentID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Create Case Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE TCases
(
    intCaseID                                       INTEGER                 NOT NULL
    ,intCaseWeightID                                INTEGER                 NOT NULL
    ,intCaseAgentID                                 INTEGER                 NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT TCases_PK PRIMARY KEY (intCaseID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Case Audit Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_TCases
(
    intCaseAuditID                                  INTEGER IDENTITY        NOT NULL
    ,intCaseID                                      INTEGER                 NOT NULL
    ,intCaseWeightID                                INTEGER                 NOT NULL
    ,intCaseAgentID                                 INTEGER                 NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_TCases_PK PRIMARY KEY (intCaseAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: Case Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTCTriggerAuditRecord ON TCases
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME   
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_TCases (intCaseID, intCaseWeightID, intCaseAgentID, strUpdatedBy, dtmUpdatedOn, strAction, 
                    strModifiedReason)
                SELECT I.intCaseID, I.intCaseWeightID, I.intCaseAgentID, SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN TCases TC ON TC.intCaseID = I.intCaseID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_TCases (intCaseID, intCaseWeightID, intCaseAgentID, strUpdatedBy, dtmUpdatedOn, strAction, 
                        strModifiedReason)
                    SELECT D.intCaseID, D.intCaseWeightID, D.intCaseAgentID, SUSER_SNAME(), GETDATE(), @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, TCases TC
                    WHERE I.intCaseID = TC.intCaseID AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_TCases (intCaseID, intCaseWeightID, intCaseAgentID, strUpdatedBy, dtmUpdatedOn, strAction, 
                                strModifiedReason)
                            SELECT I.intCaseID, I.intCaseWeightID, I.intCaseAgentID, SUSER_SNAME(), GETDATE(), @Action, 
                                I.strModifiedReason
                            FROM TCases TC
                                INNER JOIN INSERTED I ON TC.intCaseID = I.intCaseID
                            -- Set modified reason column back to ''
                            UPDATE TCases SET strModifiedReason = NULL
                            WHERE intCaseID IN (SELECT TOP 1 intCaseID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Create Standard Case Inspection Protocol Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE TStandardCaseInspections
(
    intStandardCaseInspectionID                     INTEGER                 NOT NULL
    ,intCaseID                                      INTEGER                 NOT NULL
    ,intInspectionStatusID                          INTEGER                 NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT TStandardCaseInspections_PK PRIMARY KEY (intStandardCaseInspectionID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Standard Case Inspection Protocol Audit Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_TStandardCaseInspections
(
    intStandardCaseInspectionAuditID                INTEGER IDENTITY        NOT NULL
    ,intStandardCaseInspectionID                    INTEGER                 NOT NULL
    ,intCaseID                                      INTEGER                 NOT NULL
    ,intInspectionStatusID                          INTEGER                 NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_TStandardCaseInspections_PK PRIMARY KEY (intStandardCaseInspectionAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: Standard Case Inspection Protocol Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTSCITriggerAuditRecord ON TStandardCaseInspections
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_TStandardCaseInspections (intStandardCaseInspectionID, intCaseID, intInspectionStatusID, 
                    strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                SELECT I.intStandardCaseInspectionID, I.intCaseID, I.intInspectionStatusID, SUSER_SNAME(), GETDATE(), @Action, 
                    I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN TStandardCaseInspections TSCI ON 
                        TSCI.intStandardCaseInspectionID = I.intStandardCaseInspectionID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_TStandardCaseInspections (intStandardCaseInspectionID, intCaseID, intInspectionStatusID, 
                        strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                    SELECT D.intStandardCaseInspectionID, D.intCaseID, D.intInspectionStatusID, SUSER_SNAME(), GETDATE(), 
                        @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, TStandardCaseInspections TSCI
                        WHERE I.intStandardCaseInspectionID = TSCI.intStandardCaseInspectionID 
                            AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_TStandardCaseInspections (intStandardCaseInspectionID, intCaseID, intInspectionStatusID, 
                                strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                            SELECT I.intStandardCaseInspectionID, I.intCaseID, I.intInspectionStatusID, SUSER_SNAME(), 
                                GETDATE(), @Action, I.strModifiedReason
                            FROM TStandardCaseInspections TSCI
                                INNER JOIN INSERTED I ON 
                                    TSCI.intStandardCaseInspectionID = I.intStandardCaseInspectionID
                            -- Set modified reason column back to ''
                            UPDATE TStandardCaseInspections SET strModifiedReason = NULL
                            WHERE intStandardCaseInspectionID IN 
                                (SELECT TOP 1 intStandardCaseInspectionID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Establish Referencial Integrity - Inserts
-- -------------------------------------------------------------------------------------------------------

-- #           Child                           Parent                              Column
-- --         -------                         --------                            --------
-- 1. TCases                                TCaseWeights                        intCaseWeightID
-- 2. TCases                                TCaseAgents                         intCaseAgentID
-- 3. TStandardCaseInspections              TCases                              intCaseID
-- 4. TStandardCaseInspections              TInspectionStatus                   intInspectionStatusID

-- -------------------------------------------------------------------------------------------------------
-- Create Foreign Keys
-- -------------------------------------------------------------------------------------------------------
-- 1. 
ALTER TABLE TCases ADD CONSTRAINT TCases_TCaseWeights_FK
FOREIGN KEY ( intCaseWeightID ) REFERENCES TCaseWeights ( intCaseWeightID )

-- 2. 
ALTER TABLE TCases ADD CONSTRAINT TCases_TCaseAgents_FK
FOREIGN KEY ( intCaseAgentID ) REFERENCES TCaseAgents ( intCaseAgentID )

-- 3. 
ALTER TABLE TStandardCaseInspections ADD CONSTRAINT TStandardCaseInspections_TCases_FK
FOREIGN KEY ( intCaseID ) REFERENCES TCases ( intCaseID )

-- 4. 
ALTER TABLE TStandardCaseInspections ADD CONSTRAINT TStandardCaseInspections_TInspectionStatus_FK
FOREIGN KEY ( intInspectionStatusID ) REFERENCES TInspectionStatus ( intInspectionStatusID )

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: Case Weights
-- -------------------------------------------------------------------------------------------------------
INSERT INTO TCaseWeights (intCaseWeightID, strCaseWeight)
VALUES   (1, '4lb')
        ,(2, '5lb')
        ,(3, '10lb')
        ,(4, '20lb')

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: Case Agents
-- -------------------------------------------------------------------------------------------------------
INSERT INTO TCaseAgents (intCaseAgentID, strCaseAgents)
VALUES   (1, 'ABC')
        ,(2, 'CO2')
        ,(3, 'Class K')
        ,(4, 'Halotron')
        ,(5, 'Water-Based')
        ,(6, 'Purple K')

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: Case Components
-- -------------------------------------------------------------------------------------------------------
INSERT INTO TCases (intCaseID, intCaseWeightID, intCaseAgentID)
VALUES   (1, 1, 1)
        ,(2, 1, 2)
        ,(3, 1, 3)
        ,(4, 1, 4)
        ,(5, 1, 5)
        ,(6, 1, 6)
        ,(7, 2, 1)
        ,(8, 2, 2)
        ,(9, 2, 3)
        ,(10, 2, 4)
        ,(11, 2, 5)
        ,(12, 2, 6)
        ,(13, 3, 1)
        ,(14, 3, 2)
        ,(15, 3, 3)
        ,(16, 3, 4)
        ,(17, 3, 5)
        ,(18, 3, 6)
        ,(19, 4, 1)
        ,(20, 4, 2)
        ,(21, 4, 3)
        ,(22, 4, 4)
        ,(23, 4, 5)
        ,(24, 4, 6)

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: Standard Case Inspection
-- -------------------------------------------------------------------------------------------------------
INSERT INTO TStandardCaseInspections (intStandardCaseInspectionID, intCaseID, intInspectionStatusID)
VALUES   (1, 1, 1)
        ,(2, 2, 1)
        ,(3, 7, 2)
        ,(4, 8, 3) 
        ,(5, 13, 4) 

-- -------------------------------------------------------------------------------------------------------
-- Create Housing Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE THousings
(
    intHousingID                                    INTEGER                 NOT NULL
    ,strHousingDesc                                 VARCHAR(225)            NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT THousings_PK PRIMARY KEY (intHousingID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Housing Audit Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_THousings
(
    intHousingAuditID                               INTEGER IDENTITY        NOT NULL
    ,intHousingID                                   INTEGER                 NOT NULL
    ,strHousingDesc                                 VARCHAR(255)            NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_THousings_PK PRIMARY KEY (intHousingAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: Housing Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTHOSTriggerAuditRecord ON THousings
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_THousings (intHousingID, strHousingDesc, strUpdatedBy, dtmUpdatedOn, strAction, 
                    strModifiedReason)
                SELECT I.intHousingID, I.strHousingDesc, SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN THousings THOS ON THOS.intHousingID = I.intHousingID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_THousings (intHousingID, strHousingDesc, strUpdatedBy, dtmUpdatedOn, strAction, 
                        strModifiedReason)
                    SELECT D.intHousingID, D.strHousingDesc, SUSER_SNAME(), GETDATE(), @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, THousings THOS
                    WHERE I.intHousingID = THOS.intHousingID AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_THousings (intHousingID, strHousingDesc, strUpdatedBy, dtmUpdatedOn, strAction, 
                                strModifiedReason)
                            SELECT I.intHousingID, I.strHousingDesc, SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                            FROM THousings THOS
                                INNER JOIN INSERTED I ON THOS.intHousingID = I.intHousingID
                            -- Set modified reason column back to ''
                            UPDATE THousings SET strModifiedReason = NULL
                            WHERE intHousingID IN (SELECT TOP 1 intHousingID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Create Standard Housing Inspection Protocol Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE TStandardHousingInspections
(
    intStandardHousingInspectionID                  INTEGER                NOT NULL
    ,intHousingID                                   INTEGER                NOT NULL
    ,intInspectionStatusID                          INTEGER                NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT TStandardHousingInspections_PK PRIMARY KEY (intStandardHousingInspectionID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Standard Housing Inspection Protocol Audit Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_TStandardHousingInspections
(
    intStandardHousingInspectionAuditID             INTEGER IDENTITY        NOT NULL
    ,intStandardHousingInspectionID                 INTEGER                 NOT NULL
    ,intHousingID                                   INTEGER                 NOT NULL
    ,intInspectionStatusID                          INTEGER                 NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_TStandardHousingInspections_PK PRIMARY KEY (intStandardHousingInspectionAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: Standard Housing Inspection Protocol Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTSHOSITriggerAuditRecord ON TStandardHousingInspections
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_TStandardHousingInspections (intStandardHousingInspectionID, intHousingID, 
                    intInspectionStatusID, strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                SELECT I.intStandardHousingInspectionID, I.intHousingID, I.intInspectionStatusID, SUSER_SNAME(), GETDATE(), 
                    @Action, I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN TStandardHousingInspections TSHOSI ON 
                    TSHOSI.intStandardHousingInspectionID = I.intStandardHousingInspectionID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_TStandardHousingInspections (intStandardHousingInspectionID, intHousingID, 
                        intInspectionStatusID, strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                    SELECT D.intStandardHousingInspectionID, D.intHousingID, D.intInspectionStatusID, SUSER_SNAME(), 
                        GETDATE(), @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, TStandardHousingInspections TSHOSI
                    WHERE I.intStandardHousingInspectionID = TSHOSI.intStandardHousingInspectionID 
                        AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_TStandardHousingInspections (intStandardHousingInspectionID, intHousingID, 
                                intInspectionStatusID, strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                            SELECT I.intStandardHousingInspectionID, I.intHousingID, I.intInspectionStatusID, SUSER_SNAME(), 
                                GETDATE(), @Action, I.strModifiedReason
                            FROM TStandardHousingInspections TSHOSI
                                INNER JOIN INSERTED I ON 
                                    TSHOSI.intStandardHousingInspectionID = I.intStandardHousingInspectionID
                            -- Set modified reason column back to ''
                            UPDATE TStandardHousingInspections SET strModifiedReason = NULL
                            WHERE intStandardHousingInspectionID IN 
                                (SELECT TOP 1 intStandardHousingInspectionID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Establish Referencial Integrity - Inserts
-- -------------------------------------------------------------------------------------------------------

-- #           Child                           Parent                              Column
-- --         -------                         --------                            --------
-- 1. TStandardHousingInspections           THousings                           intHousingID
-- 2. TStandardHousingInspections           TInspectionStatus                   intInspectionStatusID

-- -------------------------------------------------------------------------------------------------------
-- Create Foreign Keys
-- -------------------------------------------------------------------------------------------------------
-- 1. 
ALTER TABLE TStandardHousingInspections ADD CONSTRAINT TStandardHousingInspections_THousings_FK
FOREIGN KEY ( intHousingID ) REFERENCES THousings ( intHousingID )

-- 2. 
ALTER TABLE TStandardHousingInspections ADD CONSTRAINT TStandardHousingInspections_TInspectionStatus_FK
FOREIGN KEY ( intInspectionStatusID ) REFERENCES TInspectionStatus ( intInspectionStatusID )

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: Housing
-- -------------------------------------------------------------------------------------------------------
INSERT INTO THousings (intHousingID, strHousingDesc)
VALUES   (1, 'Cabinets')
        ,(2, 'Brackets')
        ,(3, 'No Housing Container')

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: Standard Housing Inspection
-- -------------------------------------------------------------------------------------------------------
INSERT INTO TStandardHousingInspections (intStandardHousingInspectionID, intHousingID, intInspectionStatusID)
VALUES   (1, 1, 2)
        ,(2, 1, 1)
        ,(3, 2, 1)
        ,(4, 2, 1) 
        ,(5, 3, 3) 

-- -------------------------------------------------------------------------------------------------------
-- Create States Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE TStates
(
    intStateID                                      INTEGER                 NOT NULL
    ,strStateName                                   VARCHAR(255)            NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT TStates_PK PRIMARY KEY (intStateID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: States Audit Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_TStates
(
    intStateAuditID                                 INTEGER IDENTITY        NOT NULL
    ,intStateID                                     INTEGER                 NOT NULL
    ,strStateName                                   VARCHAR(255)            NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_TStates_PK PRIMARY KEY (intStateAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: State Name Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTSTTriggerAuditRecord ON TStates
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_TStates (intStateID, strStateName, strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                SELECT I.intStateID, I.strStateName, SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN TStates TST 
                    ON TST.intStateID = I.intStateID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_TStates (intStateID, strStateName, strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                    SELECT D.intStateID, D.strStateName, SUSER_SNAME(), GETDATE(), @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, TStates TST    
                    WHERE I.intStateID = TST.intStateID AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_TStates (intStateID, strStateName, strUpdatedBy, dtmUpdatedOn, 
                                strAction, strModifiedReason)
                            SELECT I.intStateID, I.strStateName, SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                            FROM TStates TST   
                                INNER JOIN INSERTED I ON TST.intStateID = I.intStateID
                            -- Set modified reason column back to ''
                            UPDATE TStates SET strModifiedReason = NULL
                            WHERE intStateID IN (SELECT TOP 1 intStateID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Create Inspectors Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE TInspectors
(
    intInspectorID                                  INTEGER                 NOT NULL
    ,strFirstName                                   VARCHAR(255)            NOT NULL
    ,strLastName                                    VARCHAR(255)            NOT NULL
    ,strEmail                                       VARCHAR(255)            NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT TInspectors_PK PRIMARY KEY (intInspectorID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Inspectors Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_TInspectors
(
    intInspectorAuditID                             INTEGER IDENTITY        NOT NULL
    ,intInspectorID                                 INTEGER                 NOT NULL
    ,strFirstName                                   VARCHAR(255)            NOT NULL
    ,strLastName                                    VARCHAR(255)            NOT NULL
    ,strEmail                                       VARCHAR(255)            NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_TInspectors_PK PRIMARY KEY (intInspectorAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: Inspectors Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTITriggerAuditRecord ON TInspectors
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_TInspectors (intInspectorID, strFirstName, strLastName, strEmail, strUpdatedBy,
                    dtmUpdatedOn, strAction, strModifiedReason)
                SELECT I.intInspectorID, I.strFirstName, I.strLastName, I.strEmail, SUSER_SNAME(), GETDATE(), 
                    @Action, I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN TInspectors TI ON TI.intInspectorID = I.intInspectorID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_TInspectors (intInspectorID, strFirstName, strLastName, strEmail, strUpdatedBy,
                        dtmUpdatedOn, strAction, strModifiedReason)
                    SELECT D.intInspectorID, D.strFirstName, D.strLastName, D.strEmail, SUSER_SNAME(), GETDATE(), @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, TInspectors TI
                    WHERE I.intInspectorID = TI.intInspectorID AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_TInspectors (intInspectorID, strFirstName, strLastName, strEmail, strUpdatedBy,
                                dtmUpdatedOn, strAction, strModifiedReason)
                            SELECT I.intInspectorID, I.strFirstName, I.strLastName, I.strEmail, SUSER_SNAME(), GETDATE(), 
                                @Action, I.strModifiedReason
                            FROM TInspectors TI
                                INNER JOIN INSERTED I ON TI.intInspectorID = I.intInspectorID
                            -- Set modified reason column back to ''
                            UPDATE TInspectors SET strModifiedReason = NULL
                            WHERE intInspectorID IN (SELECT TOP 1 intInspectorID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Create Login Name Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE TLogins
(
    intLoginID                                      INTEGER                 NOT NULL
    ,strLoginName                                   VARCHAR(255)            NOT NULL
    ,strPassword                                    VARCHAR(225)            NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT TLogins_PK PRIMARY KEY (intLoginID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Login Name Audt Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_TLogins
(
    intLoginAuditID                                 INTEGER IDENTITY        NOT NULL
    ,intLoginID                                     INTEGER                 NOT NULL
    ,strLoginName                                   VARCHAR(255)            NOT NULL
    ,strPassword                                    VARCHAR(225)            NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_TLogins_PK PRIMARY KEY (intLoginAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: User Login Name Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTLOGTriggerAuditRecord ON TLogins
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_TLogins (intLoginID, strLoginName, strPassword, strUpdatedBy, dtmUpdatedOn, 
                    strAction, strModifiedReason)
                SELECT I.intLoginID, I.strLoginName, I.strPassword, SUSER_SNAME(), GETDATE(), @Action, 
                    I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN TLogins TLOG  
                    ON TLOG.intLoginID = I.intLoginID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_TLogins (intLoginID, strLoginName, strPassword, strUpdatedBy, dtmUpdatedOn, 
                    strAction, strModifiedReason)
                    SELECT D.intLoginID, D.strLoginName, D.strPassword, SUSER_SNAME(), GETDATE(), @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, TLogins TLOG 
                    WHERE I.intLoginID = TLOG.intLoginID AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_TLogins (intLoginID, strLoginName, strPassword, strUpdatedBy, dtmUpdatedOn, 
                                strAction, strModifiedReason)
                            SELECT I.intLoginID, I.strLoginName, I.strPassword, SUSER_SNAME(), GETDATE(), @Action, 
                                I.strModifiedReason
                            FROM TLogins TLOG 
                                INNER JOIN INSERTED I ON TLOG.intLoginID = I.intLoginID
                            -- Set modified reason column back to ''
                            UPDATE TLogins SET strModifiedReason = NULL
                            WHERE intLoginID IN (SELECT TOP 1 intLoginID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Create User Login Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE TUserLogins
(
    intUserLoginID                                  INTEGER                 NOT NULL
    ,intInspectorID                                 INTEGER                 NOT NULL
    ,intLoginID                                     INTEGER                 NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT TUserLogins_UQ UNIQUE (intInspectorID, intLoginID)
    ,CONSTRAINT TUserLogins_PK PRIMARY KEY (intUserLoginID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: User Login Audit Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_TUserLogins
(
    intUserLoginAuditID                             INTEGER IDENTITY        NOT NULL
    ,intUserLoginID                                 INTEGER                 NOT NULL
    ,intInspectorID                                 INTEGER                 NOT NULL
    ,intLoginID                                     INTEGER                 NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_TUserLogins_PK PRIMARY KEY (intUserLoginAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: User Login Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTULTriggerAuditRecord ON TUserLogins
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_TUserLogins (intUserLoginID, intInspectorID, intLoginID, 
                    strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                SELECT I.intUserLoginID, I.intInspectorID, I.intLoginID, SUSER_SNAME(), 
                    GETDATE(), @Action, I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN TUserLogins TUL
                    ON TUL.intUserLoginID = I.intUserLoginID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_TUserLogins (intUserLoginID, intInspectorID, intLoginID,  
                        strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                    SELECT D.intUserLoginID, D.intInspectorID, D.intLoginID, SUSER_SNAME(), 
                        GETDATE(), @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, TUserLogins TUL
                    WHERE I.intUserLoginID = TUL.intUserLoginID AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_TUserLogins (intUserLoginID, intInspectorID, intLoginID,  
                                strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                            SELECT I.intUserLoginID, I.intInspectorID, I.intLoginID, SUSER_SNAME(), 
                                GETDATE(), @Action, I.strModifiedReason
                            FROM TUserLogins TUL 
                                INNER JOIN INSERTED I ON TUL.intUserLoginID = I.intUserLoginID
                            -- Set modified reason column back to ''
                            UPDATE TUserLogins SET strModifiedReason = NULL
                            WHERE intUserLoginID IN (SELECT TOP 1 intUserLoginID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Create Facility Name Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE TFacilities
(
    intFacilityID                                   INTEGER                 NOT NULL
    ,strFacilityName                                VARCHAR(255)            NOT NULL
    ,strAddress                                     VARCHAR(255)            NOT NULL
    ,intStateID                                     INTEGER                 NOT NULL
    ,strZip                                         VARCHAR(255)            NOT NULL
    ,strPhoneNum                                    VARCHAR(255)            NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT TFacilities_PK PRIMARY KEY (intFacilityID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Facility Name Audit Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_TFacilities
(
    intFacilityAuditID                              INTEGER IDENTITY        NOT NULL
    ,intFacilityID                                  INTEGER                 NOT NULL
    ,strFacilityName                                VARCHAR(255)            NOT NULL
    ,strAddress                                     VARCHAR(255)            NOT NULL
    ,intStateID                                     INTEGER                 NOT NULL
    ,strZip                                         VARCHAR(255)            NOT NULL
    ,strPhoneNum                                    VARCHAR(255)            NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_TFacilities_PK PRIMARY KEY (intFacilityAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: Facility Name Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTFLTriggerAuditRecord ON TFacilities
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_TFacilities (intFacilityID, strFacilityName, strAddress, intStateID, strZip,
                    strPhoneNum, strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                SELECT I.intFacilityID, I.strFacilityName, I.strAddress, I.intStateID, I.strZip, I.strPhoneNum, 
                    SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN TFacilities TFL 
                    ON TFL.intFacilityID = I.intFacilityID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_TFacilities (intFacilityID, strFacilityName, strAddress, intStateID, strZip,
                        strPhoneNum, strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                    SELECT D.intFacilityID, D.strFacilityName, D.strAddress, D.intStateID, D.strZip, D.strPhoneNum, 
                        SUSER_SNAME(), GETDATE(), @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, TFacilities TFL   
                    WHERE I.intFacilityID = TFL.intFacilityID AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_TFacilities (intFacilityID, strFacilityName, strAddress, intStateID, strZip,
                                strPhoneNum, strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                            SELECT I.intFacilityID, I.strFacilityName, I.strAddress, I.intStateID, I.strZip, I.strPhoneNum, 
                                SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                            FROM TFacilities TFL  
                                INNER JOIN INSERTED I ON TFL.intFacilityID = I.intFacilityID
                            -- Set modified reason column back to ''
                            UPDATE TFacilities SET strModifiedReason = NULL
                            WHERE intFacilityID IN (SELECT TOP 1 intFacilityID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Create Fire Extinguisher Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE TFireEx
(
    intFireExID                                     INTEGER                 NOT NULL
    ,intCaseID                                      INTEGER                 NOT NULL
    ,strSerialNum                                   VARCHAR(255)            NOT NULL
    ,dtmManufactureDate                             DATE
    ,dtmServiceDate                                 DATE
    ,dtmReserviceDate                               DATE
    ,dtmInstallationDate                            DATE
    ,dtmLastInspectionDate                          DATE
    ,dtmNextInspectionDate                          DATE
    ,blnDeviceInUse                                 VARCHAR(225)            NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT TFireEx_PK PRIMARY KEY (intFireExID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Fire Extinguisher Audit Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_TFireEx
(
    intFireExAuditID                                INTEGER IDENTITY        NOT NULL
    ,intFireExID                                    INTEGER                 NOT NULL
    ,intCaseID                                      INTEGER                 NOT NULL
    ,strSerialNum                                   VARCHAR(255)            NOT NULL
    ,dtmManufactureDate                             DATE
    ,dtmServiceDate                                 DATE
    ,dtmReserviceDate                               DATE
    ,dtmInstallationDate                            DATE
    ,dtmLastInspectionDate                          DATE
    ,dtmNextInspectionDate                          DATE
    ,blnDeviceInUse                                 VARCHAR(225)            NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_TFireEx_PK PRIMARY KEY (intFireExAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: Fire Extinguisher Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTFXTriggerAuditRecord ON TFireEx
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_TFireEx (intFireExID, intCaseID, strSerialNum, dtmManufactureDate, dtmServiceDate,
                    dtmReserviceDate, dtmInstallationDate, dtmLastInspectionDate, dtmNextInspectionDate, blnDeviceInUse,
                    strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                SELECT I.intFireExID, I.intCaseID, I.strSerialNum, I.dtmManufactureDate, I.dtmServiceDate, 
                    I.dtmReserviceDate, I.dtmInstallationDate, I.dtmLastInspectionDate, I.dtmNextInspectionDate, 
                    I.blnDeviceInUse, SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN TFireEx TFX ON TFX.intFireExID = I.intFireExID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_TFireEx (intFireExID, intCaseID, strSerialNum, dtmManufactureDate, dtmServiceDate,
                        dtmReserviceDate, dtmInstallationDate, dtmLastInspectionDate, dtmNextInspectionDate, blnDeviceInUse,
                        strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                    SELECT D.intFireExID, D.intCaseID, D.strSerialNum, D.dtmManufactureDate, D.dtmServiceDate, 
                        D.dtmReserviceDate, D.dtmInstallationDate, D.dtmLastInspectionDate, D.dtmNextInspectionDate, 
                        D.blnDeviceInUse, SUSER_SNAME(), GETDATE(), @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, TFireEx TFX
                    WHERE I.intCaseID = TFX.intCaseID AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_TFireEx (intFireExID, intCaseID, strSerialNum, dtmManufactureDate, 
                                dtmServiceDate, dtmReserviceDate, dtmInstallationDate, dtmLastInspectionDate, 
                                dtmNextInspectionDate, blnDeviceInUse, strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                            SELECT I.intFireExID, I.intCaseID, I.strSerialNum, I.dtmManufactureDate, I.dtmServiceDate, 
                                I.dtmReserviceDate, I.dtmInstallationDate, I.dtmLastInspectionDate, I.dtmNextInspectionDate, 
                                I.blnDeviceInUse, SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                            FROM TFireEx TFX
                                INNER JOIN INSERTED I ON TFX.intCaseID = I.intCaseID
                            -- Set modified reason column back to ''
                            UPDATE TFireEx SET strModifiedReason = NULL
                            WHERE intCaseID IN (SELECT TOP 1 intCaseID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Create Location Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE TLocations
(
    intLocationID                                   INTEGER                 NOT NULL
    ,strLocationDesc                                VARCHAR(255)            NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT TLocations_PK PRIMARY KEY (intLocationID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Location Audit Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_TLocations
(
    intLocationAuditID                              INTEGER IDENTITY        NOT NULL
    ,intLocationID                                  INTEGER                 NOT NULL
    ,strLocationDesc                                VARCHAR(255)            NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_TLocations_PK PRIMARY KEY (intLocationAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: Location Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTLTriggerAuditRecord ON TLocations
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_TLocations (intLocationID, strLocationDesc, strUpdatedBy, dtmUpdatedOn, strAction, 
                    strModifiedReason)
                SELECT I.intLocationID, I.strLocationDesc, SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN TLocations TL ON TL.intLocationID = I.intLocationID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_TLocations (intLocationID, strLocationDesc, strUpdatedBy, dtmUpdatedOn, strAction, 
                        strModifiedReason)
                    SELECT D.intLocationID, D.strLocationDesc, SUSER_SNAME(), GETDATE(), @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, TLocations TL
                    WHERE I.intLocationID = TL.intLocationID AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_TLocations (intLocationID, strLocationDesc, strUpdatedBy, dtmUpdatedOn, strAction, 
                                strModifiedReason)
                            SELECT I.intLocationID, I.strLocationDesc, SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                            FROM TLocations TL
                                INNER JOIN INSERTED I ON TL.intLocationID = I.intLocationID
                            -- Set modified reason column back to ''
                            UPDATE TLocations SET strModifiedReason = NULL
                            WHERE intLocationID IN (SELECT TOP 1 intLocationID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Create Fire Extinguisher Inspector Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE TFireExInspectors
(
    intFireExInspectorID                            INTEGER                 NOT NULL
    ,intInspectorID                                 INTEGER                 NOT NULL
    ,intFireExID                                    INTEGER                 NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT TFireExInspectors_PK PRIMARY KEY (intFireExInspectorID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Fire Extinguisher Inspector Audit Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_TFireExInspectors
(
    intFireExInspectorAuditID                       INTEGER IDENTITY        NOT NULL
    ,intFireExInspectorID                           INTEGER                 NOT NULL
    ,intInspectorID                                 INTEGER                 NOT NULL
    ,intFireExID                                    INTEGER                 NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_TFireExInspectors_PK PRIMARY KEY (intFireExInspectorAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: Fire Extinguisher Inspector Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTFXITriggerAuditRecord ON TFireExInspectors
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_TFireExInspectors (intFireExInspectorID, intInspectorID, intFireExID, strUpdatedBy,
                    dtmUpdatedOn, strAction, strModifiedReason)
                SELECT I.intFireExInspectorID, I.intInspectorID, I.intFireExID, SUSER_SNAME(), GETDATE(), @Action, 
                    I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN TFireExInspectors TFXI ON TFXI.intFireExInspectorID = I.intFireExInspectorID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_TFireExInspectors (intFireExInspectorID, intInspectorID, intFireExID, strUpdatedBy,
                        dtmUpdatedOn, strAction, strModifiedReason)
                    SELECT D.intFireExInspectorID, D.intInspectorID, D.intFireExID, SUSER_SNAME(), 
                        GETDATE(), @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, TFireExInspectors TFXI
                    WHERE I.intFireExInspectorID = TFXI.intFireExInspectorID AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_TFireExInspectors (intFireExInspectorID, intInspectorID, intFireExID, strUpdatedBy,
                                dtmUpdatedOn, strAction, strModifiedReason)
                            SELECT I.intFireExInspectorID, I.intInspectorID, I.intFireExID, SUSER_SNAME(), GETDATE(), @Action, 
                                I.strModifiedReason
                            FROM TFireExInspectors TFXI
                                INNER JOIN INSERTED I ON TFXI.intFireExInspectorID = I.intFireExInspectorID
                            -- Set modified reason column back to ''
                            UPDATE TFireExInspectors SET strModifiedReason = NULL
                            WHERE intFireExInspectorID IN (SELECT TOP 1 intFireExInspectorID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Create Fire Extinguisher Location Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE TFireExLocations
(
    intFireExLocationID                             INTEGER                 NOT NULL
    ,intLocationID                                  INTEGER                 NOT NULL
    ,intFireExID                                    INTEGER                 NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT TFireExLocations_PK PRIMARY KEY (intFireExLocationID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Fire Extinguisher Location Audit Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_TFireExLocations
(
    intFireExLocationAuditID                        INTEGER IDENTITY        NOT NULL
    ,intFireExLocationID                            INTEGER                 NOT NULL
    ,intLocationID                                  INTEGER                 NOT NULL
    ,intFireExID                                    INTEGER                 NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_TFireExLocations_PK PRIMARY KEY (intFireExLocationAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: Fire Extinguisher Location Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTFXLTriggerAuditRecord ON TFireExLocations
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_TFireExLocations (intFireExLocationID, intLocationID, intFireExID, strUpdatedBy, 
                    dtmUpdatedOn, strAction, strModifiedReason)
                SELECT I.intFireExLocationID, I.intLocationID, I.intFireExID, SUSER_SNAME(), GETDATE(), @Action, 
                    I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN TFireExLocations TFXL 
                    ON TFXL.intFireExLocationID = I.intFireExLocationID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_TFireExLocations (intFireExLocationID, intLocationID, intFireExID, strUpdatedBy, 
                        dtmUpdatedOn, strAction, strModifiedReason)
                    SELECT D.intFireExLocationID, D.intLocationID, D.intFireExID, SUSER_SNAME(), GETDATE(), @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, TFireExLocations TFXL 
                    WHERE I.intFireExLocationID = TFXL.intFireExLocationID AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_TFireExLocations (intFireExLocationID, intLocationID, intFireExID, strUpdatedBy, 
                                dtmUpdatedOn, strAction, strModifiedReason)
                            SELECT I.intFireExLocationID, I.intLocationID, I.intFireExID, SUSER_SNAME(), GETDATE(), @Action, 
                                I.strModifiedReason
                            FROM TFireExLocations TFXL 
                                INNER JOIN INSERTED I ON TFXL.intFireExLocationID = I.intFireExLocationID
                            -- Set modified reason column back to ''
                            UPDATE TFireExLocations SET strModifiedReason = NULL
                            WHERE intFireExLocationID IN (SELECT TOP 1 intFireExLocationID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Create Fire Extinguisher Facility Location
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE TFireExFacilityLocations
(
    intFireExFacilityLocationID                     INTEGER                 NOT NULL
    ,intFacilityID                                  INTEGER                 NOT NULL
    ,intLocationID                                  INTEGER                 NOT NULL
    ,intFireExID                                    INTEGER                 NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT TFireExFacilityLocations_PK PRIMARY KEY (intFireExFacilityLocationID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Fire Extinguisher Facility Location Audit Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_TFireExFacilityLocations
(
    intFireExFacilityLocationAuditID                INTEGER IDENTITY        NOT NULL
    ,intFireExFacilityLocationID                    INTEGER                 NOT NULL
    ,intFacilityID                                  INTEGER                 NOT NULL
    ,intLocationID                                  INTEGER                 NOT NULL
    ,intFireExID                                    INTEGER                 NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_TFireExFacilityLocations_PK PRIMARY KEY (intFireExFacilityLocationAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: Fire Extinguisher Facility Location Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTFXFLTriggerAuditRecord ON TFireExFacilityLocations
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_TFireExFacilityLocations (intFireExFacilityLocationID, intFacilityID, intLocationID, 
                    intFireExID, strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                SELECT I.intFireExFacilityLocationID, I.intFacilityID, I.intLocationID, I.intFireExID, 
                    SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN TFireExFacilityLocations TFXFL 
                    ON TFXFL.intFireExFacilityLocationID = I.intFireExFacilityLocationID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_TFireExFacilityLocations (intFireExFacilityLocationID, intFacilityID, intLocationID, 
                        intFireExID, strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                    SELECT D.intFireExFacilityLocationID, D.intFacilityID, D.intLocationID, D.intFireExID, 
                        SUSER_SNAME(), GETDATE(), @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, TFireExFacilityLocations TFXFL 
                    WHERE I.intFireExFacilityLocationID = TFXFL.intFireExFacilityLocationID AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_TFireExFacilityLocations (intFireExFacilityLocationID, intFacilityID, 
                                intLocationID, intFireExID, strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                            SELECT I.intFireExFacilityLocationID, I.intFacilityID, I.intLocationID, I.intFireExID, 
                                SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                            FROM TFireExFacilityLocations TFXFL 
                                INNER JOIN INSERTED I ON TFXFL.intFireExFacilityLocationID = I.intFireExFacilityLocationID
                            -- Set modified reason column back to ''
                            UPDATE TFireExFacilityLocations SET strModifiedReason = NULL
                            WHERE intFireExFacilityLocationID IN (SELECT TOP 1 intFireExFacilityLocationID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Create Standard Inspection Protocol Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE TStandardInspections
(
    intStandardInspectionID                         INTEGER                 NOT NULL
    ,intStandardHoseInspectionID                    INTEGER                 NOT NULL
    ,intStandardHandleInspectionID                  INTEGER                 NOT NULL
    ,intStandardPressGuageInspectionID              INTEGER                 NOT NULL
    ,intStandardCaseInspectionID                    INTEGER                 NOT NULL
    ,intStandardHousingInspectionID                 INTEGER                 NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT TStandardInspections_PK PRIMARY KEY (intStandardInspectionID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Standard Inspection Protocol Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_TStandardInspections
(
    intStandardInspectionAuditID                    INTEGER IDENTITY        NOT NULL
    ,intStandardInspectionID                        INTEGER                 NOT NULL
    ,intStandardHoseInspectionID                    INTEGER                 NOT NULL
    ,intStandardHandleInspectionID                  INTEGER                 NOT NULL
    ,intStandardPressGuageInspectionID              INTEGER                 NOT NULL
    ,intStandardCaseInspectionID                    INTEGER                 NOT NULL
    ,intStandardHousingInspectionID                 INTEGER                 NOT NULL
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_TStandardInspections_PK PRIMARY KEY (intStandardInspectionAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: Standard Inspection Protocol Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTSITriggerAuditRecord ON TStandardInspections
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_TStandardInspections (intStandardInspectionID, intStandardHoseInspectionID, 
                    intStandardHandleInspectionID, intStandardPressGuageInspectionID, intStandardCaseInspectionID, 
                    intStandardHousingInspectionID, strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                SELECT I.intStandardInspectionID, I.intStandardHoseInspectionID, I.intStandardHandleInspectionID, 
                    I.intStandardPressGuageInspectionID, I.intStandardCaseInspectionID, 
                    I.intStandardHousingInspectionID, SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                FROM INSERTED AS I
                    INNER JOIN TStandardInspections TSI
                    ON TSI.intStandardInspectionID = I.intStandardInspectionID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_TStandardInspections (intStandardInspectionID, intStandardHoseInspectionID, 
                        intStandardHandleInspectionID, intStandardPressGuageInspectionID, intStandardCaseInspectionID, 
                        intStandardHousingInspectionID, strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                    SELECT D.intStandardInspectionID, D.intStandardHoseInspectionID, D.intStandardHandleInspectionID, 
                        D.intStandardPressGuageInspectionID, D.intStandardCaseInspectionID, 
                        D.intStandardHousingInspectionID, SUSER_SNAME(), GETDATE(), @Action, ''
                    FROM DELETED AS D
                END             -- End Delete Info
            ELSE
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, TStandardInspections TSI
                    WHERE I.intStandardInspectionID = TSI.intStandardInspectionID AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_TStandardInspections (intStandardInspectionID, intStandardHoseInspectionID, 
                                intStandardHandleInspectionID, intStandardPressGuageInspectionID, intStandardCaseInspectionID, 
                                intStandardHousingInspectionID, strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                            SELECT I.intStandardInspectionID, I.intStandardHoseInspectionID, I.intStandardHandleInspectionID, 
                                I.intStandardPressGuageInspectionID, I.intStandardCaseInspectionID, 
                                I.intStandardHousingInspectionID, SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                            FROM TStandardInspections TSI
                                INNER JOIN INSERTED I ON TSI.intStandardInspectionID = I.intStandardInspectionID
                            -- Set modified reason column back to ''
                            UPDATE TStandardInspections SET strModifiedReason = NULL
                            WHERE intStandardInspectionID IN (SELECT TOP 1 intStandardInspectionID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Create Fire Extinguisher Inspection Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE TFireExInspections
(
    intFireExInspectionID                           INTEGER                 NOT NULL
    ,intFireExID                                    INTEGER                 NOT NULL
    ,intLocationID                                  INTEGER                 NOT NULL
    ,intStandardInspectionID                        INTEGER                 NOT NULL
    ,intInspectorID                                 INTEGER                 NOT NULL
    ,dtmLastInspectionDate                          DATE
    ,dtmNextInspectionDate                          DATE
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT TFireExInspections_PK PRIMARY KEY (intFireExInspectionID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Z Table: Fire Extinguisher Inspection Audit Table
-- -------------------------------------------------------------------------------------------------------
CREATE TABLE Z_TFireExInspections
(
    intFireExInspectionAuditID                      INTEGER IDENTITY        NOT NULL
    ,intFireExInspectionID                          INTEGER                 NOT NULL
    ,intFireExID                                    INTEGER                 NOT NULL
    ,intLocationID                                  INTEGER                 NOT NULL
    ,intStandardInspectionID                        INTEGER                 NOT NULL
    ,intInspectorID                                 INTEGER                 NOT NULL
    ,dtmLastInspectionDate                          DATE
    ,dtmNextInspectionDate                          DATE
    ,strUpdatedBy                                   VARCHAR(225)            NOT NULL
    ,dtmUpdatedOn                                   DATETIME                NOT NULL
    ,strAction                                      VARCHAR(1)              NOT NULL
    ,strModifiedReason                              VARCHAR(1000)

    ,CONSTRAINT Z_TFireExInspections_PK PRIMARY KEY (intFireExInspectionAuditID)
)

-- -------------------------------------------------------------------------------------------------------
-- Create Trigger: Fire Extinguisher Inspection Table
    -- Defining if it's an UPDATE('U'), INSERT('I'), or DELETE('D')    
    -- during triggers SQL Server uses logial tables 'inserted' and 'deleted'
    -- these tables are only used by the trigger and you cannot write commands agaisnt them outside of 
    -- the trigger.
    -- Inserted tables - stores copies of affected rows during an INSERT or UPDATE
    -- Deleted tables - stores copies of affected rows during a DELETE or UPDATE
-- -------------------------------------------------------------------------------------------------------
GO

CREATE TRIGGER tblTFXINTriggerAuditRecord ON TFireExInspections
AFTER UPDATE, INSERT, DELETE
AS
    DECLARE @Now DATETIME
    DECLARE @ModifiedReason VARCHAR(1000)
    DECLARE @Action VARCHAR(1)
    SET @Action = ''

    BEGIN
    IF (SELECT COUNT(*) FROM INSERTED) > 0          -- True if it is an INSERT or UPDATE
        IF (SELECT COUNT(*) FROM DELETED) > 0       -- True if it is a DELETE or UPDATE
            SET @Action = 'U'   -- no record in INSERTED so it has to be an UPDATE
        ELSE
            SET @Action = 'I'   -- no record in DELETED so it has to be an INSERT
    ELSE 
        SET @Action = 'D'       -- no record in INSERTED but not in UPDATE so it has to be a DELETE
    END

    SET @Now = GETDATE()        -- Gets current date/time
        IF (@Action = 'I')
            BEGIN               -- Begins the insert info
                INSERT INTO Z_TFireExInspections (intFireExInspectionID, intFireExID, intLocationID, 
                    intStandardInspectionID, intInspectorID, dtmLastInspectionDate, dtmNextInspectionDate,
                    strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                SELECT I.intFireExInspectionID, I.intFireExID, I.intLocationID, I.intStandardInspectionID,
                    I.intInspectorID, I.dtmLastInspectionDate, I.dtmNextInspectionDate,
                    SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                FROM INSERTED I
                    INNER JOIN TFireExInspections TFXIN ON TFXIN.intFireExInspectionID = I.intFireExInspectionID
            END                 -- End Insert Info
        ELSE
            IF (@Action = 'D')
                BEGIN           -- Begins the delete info
                    INSERT INTO Z_TFireExInspections (intFireExInspectionID, intFireExID, intLocationID, 
                        intStandardInspectionID, intInspectorID, dtmLastInspectionDate, 
                        dtmNextInspectionDate, strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                    SELECT D.intFireExInspectionID, D.intFireExID, D.intLocationID, D.intStandardInspectionID,
                        D.intInspectorID, D.dtmLastInspectionDate, D.dtmNextInspectionDate, 
                        SUSER_SNAME(), GETDATE(), @Action, ''
                    FROM DELETED D
                END             -- End Delete Info
            ELSE -- @Action='U' 
                BEGIN
                    IF EXISTS (SELECT TOP 1 I.strModifiedReason FROM INSERTED I, TFireExInspections TFXIN
                            WHERE I.intFireExInspectionID = TFXIN.intFireExInspectionID AND I.strModifiedReason <> '')
                        BEGIN    -- Begins Insert of update info
                            INSERT INTO Z_TFireExInspections (intFireExInspectionID, intFireExID, intLocationID, 
                                intStandardInspectionID, intInspectorID, dtmLastInspectionDate, 
                                dtmNextInspectionDate, strUpdatedBy, dtmUpdatedOn, strAction, strModifiedReason)
                            SELECT I.intFireExInspectionID, I.intFireExID, I.intLocationID, I.intStandardInspectionID,
                                I.intInspectorID, I.dtmLastInspectionDate, I.dtmNextInspectionDate,
                                SUSER_SNAME(), GETDATE(), @Action, I.strModifiedReason
                            FROM TFireExInspections TFXIN
                                INNER JOIN INSERTED I ON TFXIN.intFireExInspectionID = I.intFireExInspectionID
                            -- Set modified reason column back to ''
                            UPDATE TFireExInspections SET strModifiedReason = NULL
                            WHERE intFireExInspectionID IN (SELECT TOP 1 intFireExInspectionID FROM INSERTED)
                        END -- End Update Info
                    ELSE
                        -- Begin if no modified reason supplied
                        BEGIN
                            PRINT 'Error and rolled back, enter modified reason'
                            ROLLBACK
                        -- End modified reason error
                        END
                END     -- End Update Info
GO

-- -------------------------------------------------------------------------------------------------------
-- Establish Referencial Integrity - Inserts
-- -------------------------------------------------------------------------------------------------------

-- #           Child                         Parent                              Column
-- --         -------                       --------                            --------
-- 1. TUserLogins                           TInspectors                         intInspectorID
-- 2. TUserLogins                           TLogins                             intLoginID
-- 3. TFacilities                           TStates                             intStateID
-- 4. TFireExInspectors                     TInspectors                         intInspectorID
-- 5. TFireExInspectors                     TFireEx                             intFireExID
-- 6. TFireExLocations                      TLocations                          intLocationID
-- 7. TFireExLocations                      TFireEx                             intFireExID
-- 8. TFireExFacilityLocations              TFacilities                         intFacilityID
-- 9. TFireExFacilityLocations              TLocations                          intLocationID
-- 10. TFireExFacilityLocations             TFireEx                             intFireExID
-- 11. TStandardInspections                 TStandardHoseInspections            intStandardHoseInspectionID
-- 12. TStandardInspections                 TStandardHandleInspections          intStandardHandleInspectionID
-- 13. TStandardInspections                 TStandardPressGuageInspections      intStandardPressGuagueInspectionID
-- 14. TStandardInspections                 TStandardCaseInspections            intStandardCaseInspectionID
-- 15. TStandardInspections                 TStandardHousingInspections         intStandardHousingInspectionID
-- 16. TFireExInspections                   TFireEx                             intFireExID
-- 17. TFireExInspections                   TLocations                          intLocationID
-- 18. TFireExInspections                   TStandardInspections                intStandardInspectionID
-- 19. TFireExInspections                   TInspectors                         intInspectorID 

-- -------------------------------------------------------------------------------------------------------
-- Create Foreign Keys
-- -------------------------------------------------------------------------------------------------------
-- 1.
ALTER TABLE TUserLogins ADD CONSTRAINT TUserLogins_TInspectors_FK
FOREIGN KEY ( intInspectorID ) REFERENCES TInspectors ( intInspectorID )

-- 2.
ALTER TABLE TUserLogins ADD CONSTRAINT TUserLogins_TLogins_FK
FOREIGN KEY ( intLoginID ) REFERENCES TLogins ( intLoginID )

-- -------------------------------------------------------------------------------------------------------
-- Ensure No Duplicated Data
-- -------------------------------------------------------------------------------------------------------
ALTER TABLE TUserLogins ADD CONSTRAINT TUserLogins_UNIQUE
UNIQUE (intInspectorID, intLoginID)

-- 3.
ALTER TABLE TFacilities ADD CONSTRAINT TFacilities_TStates_FK
FOREIGN KEY ( intStateID ) REFERENCES TStates ( intStateID )

-- 4.
ALTER TABLE TFireExInspectors ADD CONSTRAINT TFireExInspectors_TInspectors_FK
FOREIGN KEY ( intInspectorID ) REFERENCES TInspectors ( intInspectorID )

-- 5.
ALTER TABLE TFireExInspectors ADD CONSTRAINT TFireExInspectors_TFireEx_FK
FOREIGN KEY ( intFireExID ) REFERENCES TFireEx ( intFireExID )

-- 6. 
ALTER TABLE TFireExLocations ADD CONSTRAINT TFireExLocations_TLocations_FK
FOREIGN KEY ( intLocationID ) REFERENCES TLocations ( intLocationID )

-- 7. 
ALTER TABLE TFireExLocations ADD CONSTRAINT TFireExLocations_TFireEx_FK
FOREIGN KEY ( intFireExID ) REFERENCES TFireEx ( intFireExID )

-- 8. 
ALTER TABLE TFireExFacilityLocations ADD CONSTRAINT TFireExFacilityLocations_TFacilities_FK
FOREIGN KEY ( intFacilityID ) REFERENCES TFacilities ( intFacilityID )

-- 9. 
ALTER TABLE TFireExFacilityLocations ADD CONSTRAINT TFireExFacilityLocations_TLocations_FK
FOREIGN KEY ( intLocationID ) REFERENCES TLocations ( intLocationID )

-- 10. 
ALTER TABLE TFireExFacilityLocations ADD CONSTRAINT TFireExFacilityLocations_TFireEx_FK
FOREIGN KEY ( intFireExID ) REFERENCES TFireEx ( intFireExID )

-- 11.
ALTER TABLE TStandardInspections ADD CONSTRAINT TStandardInspections_TStandardHoseInspections_FK
FOREIGN KEY ( intStandardHoseInspectionID ) REFERENCES TStandardHoseInspections ( intStandardHoseInspectionID )

-- 12.
ALTER TABLE TStandardInspections ADD CONSTRAINT TStandardInspections_TStandardHandleInspections_FK
FOREIGN KEY ( intStandardHandleInspectionID ) REFERENCES TStandardHandleInspections ( intStandardHandleInspectionID )

-- 13.
ALTER TABLE TStandardInspections ADD CONSTRAINT TStandardInspections_TStandardPressGuageInspections_FK
FOREIGN KEY ( intStandardPressGuageInspectionID ) REFERENCES TStandardPressGuageInspections ( intStandardPressGuageInspectionID )

-- 14.
ALTER TABLE TStandardInspections ADD CONSTRAINT TStandardInspections_TStandardCaseInspections_FK
FOREIGN KEY ( intStandardCaseInspectionID ) REFERENCES TStandardCaseInspections ( intStandardCaseInspectionID )

-- 15.
ALTER TABLE TStandardInspections ADD CONSTRAINT TStandardInspections_TStandardHousingInspections_FK
FOREIGN KEY ( intStandardHousingInspectionID ) REFERENCES TStandardHousingInspections ( intStandardHousingInspectionID )
 
-- 16.
ALTER TABLE TFireExInspections ADD CONSTRAINT TFireExInspections_TFireEx_FK
FOREIGN KEY ( intFireExID ) REFERENCES TFireEx ( intFireExID )

-- 17.
ALTER TABLE TFireExInspections ADD CONSTRAINT TFireExInspections_TLocations_FK
FOREIGN KEY ( intLocationID ) REFERENCES TLocations ( intLocationID ) 

-- 18.
ALTER TABLE TFireExInspections ADD CONSTRAINT TFireExInspections_TStandardInspections_FK
FOREIGN KEY ( intStandardInspectionID ) REFERENCES TStandardInspections ( intStandardInspectionID ) 

-- 19.
ALTER TABLE TFireExInspections ADD CONSTRAINT TFireExInspections_TInspectors_FK
FOREIGN KEY ( intInspectorID ) REFERENCES TInspectors ( intInspectorID ) 

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: States 
-- -------------------------------------------------------------------------------------------------------
INSERT INTO TStates (intStateID, strStateName)
VALUES   (1, 'Indiana')
        ,(2, 'Ohio')
        ,(3, 'Kenucky')

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: Inspectors
-- -------------------------------------------------------------------------------------------------------
INSERT INTO TInspectors (intInspectorID, strFirstName, strLastName, strEmail)
VALUES   (1, 'Luke', 'Skywalker', 'Luke.Skywalker@gmail.com')
        ,(2, 'Han', 'Solo', 'Han.Solo@gmail.com')
        ,(3, 'Leia', 'Organa', 'Leia.Organa@gmail.com')
        ,(4, 'Moff', 'Tarkin', 'Moff.Tarkin@gmail.com')
        ,(5, 'Obi-Wan', 'Kenobi', 'Obi-Wan.Kenobi@gmail.com')
        ,(6, 'David', 'Teixeira', 'David.T@gmail.com')

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: Login Name
-- -------------------------------------------------------------------------------------------------------
INSERT INTO TLogins (intLoginID, strLoginName, strPassword)
VALUES   (1, 'Luke.Skywalker', '0f93d48a1415a6bf931b4fda8e48aa8b285fffd80a7b4d2e6c79128d3cbd9dd49ff230c375c22f285b37fd156ce68acbf392472f427be2a2f41c660698fece52') -- Password = T1234@
        ,(2, 'Han.Solo', '3f0db7cabdf772a1903e2a530234036d6ac6006bf61050dd513d4ab0a7dae5ca836f22190c02ddb4a4f01425596b3d9d0de418f887703a58a8dc04d67b4d0d4f') -- Password = R4567#
        ,(3, 'Leia.Organa', '05024120248aea9c48eea7d6361cb896dd2639eefd0105988102ab355099cfcdaf6f08f0c117c5c833cb50e037d5fdcdda5aa3195e956ad0809247668fd27d15') -- Password = E7890*
        ,(4, 'Moff.Tarkin', 'a29e6003ef782173bbc63603637211f24d8055988fcfc2ef542a05d18f0d924dbed2fa66debb5b94074943ad27450f8d8ca959f71c00d851ab411de0767d1ed8') -- Password = 2ABCD&
        ,(5, 'Obi-Wan.Kenobi', '5a608c82bbf311231e7d64f7f61b70c9e1974faddfe66defda6fbd6ebdb9bef546c066d9f1ce4a44fda9fd060285e25b11d0ca46b8d9fe1b77b923af8abeecbe') -- Password = 3Cdefg^
        ,(6, 'David.Teixeira', '07a3c8b8d1ff7b7e57d174b37e67723f3f5c063a47f17b0e6cf214d30f03e1c94d147df394b559d4e67c7ef95840de193bd9d7551fe21e9768c0f000a624d4b4') -- Password = Er1@

------------------------------------------------------------------------------
-- Add Data To Table:  User Logins 
-- -------------------------------------------------------------------------------------------------------
INSERT INTO TUserLogins (intUserLoginID, intInspectorID, intLoginID)
VALUES   (1, 1, 1)
        ,(2, 2, 2)
        ,(3, 3, 3)
        ,(4, 4, 4)
        ,(5, 5, 5)
        ,(6, 6, 6)

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: Facility Name 
-- -------------------------------------------------------------------------------------------------------
INSERT INTO TFacilities (intFacilityID, strFacilityName, strAddress, intStateID, strZip, strPhoneNum)
VALUES   (1, 'Indianapolis Campus', '50 W. Fall Creek Parkway N.', 1, '46208', '317-921-4800')
        ,(2, 'Richmond Campus', '2357 Chester Boulevard', 1, '47374', '765-966-2656')
        ,(3, 'Lawrenceburg Campus', '50 Walnut Street', 1, '47025', '812-537-4010')
        ,(4, 'Bloomington Campus', '200 Daniels Way', 1, '47404', '812-330-6013')
        ,(5, 'Anderson Campus', '815 E 60th Street', 1, '46013', '765-643-7133')

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: Fire Extinguishers
-- -------------------------------------------------------------------------------------------------------
INSERT INTO TFireEx (intFireExID, intCaseID, strSerialNum, dtmManufactureDate, dtmServiceDate, 
dtmReserviceDate, dtmInstallationDate, dtmLastInspectionDate, dtmNextInspectionDate, blnDeviceInUse)
VALUES   (1, 1, '01278', '07/01/2022', '08/01/2022', '08/01/2023', '09/01/2022', '02/20/2023', '03/20/2023', 'Yes')
        ,(2, 1, '01281', '11/01/2022', '12/01/2022', '12/01/2023', '01/01/2023', '02/20/2023', '03/20/2023', 'Yes')
        ,(3, 1, 'PD1098', '11/01/2022', '12/01/2022', '12/01/2023', '01/01/2023', '01/20/2023', '02/20/2023', 'Yes')
        ,(4, 7, 'I-0098', '07/01/2022', '08/01/2022', '08/01/2023', '09/01/2022', '02/20/2023', '03/20/2023', 'Yes')
        ,(5, 7, '01279', '09/01/2022', '10/01/2022', '10/01/2023', '11/01/2022', '02/20/2023', '03/20/2023', 'Yes')
        ,(6, 7, 'S-2148', '01/01/2022', '02/01/2022', '02/01/2023', '03/01/2023', '02/20/2023', '03/20/2023', 'Yes')
        ,(7, 13, 'I-0095', '09/01/2022', '10/01/2022', '10/01/2023', '11/01/2022', '02/20/2023', '03/20/2023', 'Yes')
        ,(8, 13, 'I-0094', '05/01/2022', '06/01/2022', '06/01/2023', '07/01/2022', '01/20/2023', '02/20/2023', 'Yes')
        ,(9, 13, 'I-0096', '05/01/2022', '06/01/2022', '06/01/2023', '07/01/2022', '02/20/2023', '03/20/2023', 'Yes')
        ,(10, 19, 'PD1232', '07/01/2022', '08/01/2022', '08/01/2023', '09/01/2022', '02/20/2023', '03/20/2023', 'Yes')
        ,(11, 19, '01280', '11/01/2022', '12/01/2022', '12/01/2023', '01/01/2023', '01/20/2023', '02/20/2023', 'Yes')
        ,(12, 19, 'PD1146', '06/01/2022', '07/01/2022', '07/01/2023', '08/01/2022', '02/20/2023', '03/20/2023', 'Yes')
        ,(13, 6, 'PD1147', '11/01/2022', '12/01/2022', '12/01/2023', '01/01/2023', '02/20/2023', '03/20/2023', 'No')
        ,(14, 16, 'JK9302', '11/01/2022', '12/01/2022', '12/01/2023', '01/01/2023', '02/20/2023', '03/20/2023', 'No')
        ,(15, 22, 'E-6280', '11/01/2022', '12/01/2022', '12/01/2023', '01/01/2023', '02/20/2023', '03/20/2023', 'No')

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: Locations
-- -------------------------------------------------------------------------------------------------------
INSERT INTO TLocations (intLocationID, strLocationDesc)
VALUES   (1, 'Not In Use')
        ,(2, 'Main Enterance')
        ,(3, 'Main Exit')
        ,(4, 'First Floor Hall')
        ,(5, 'Second Floor Hall')
        ,(6, 'Third Floor Hall')
        ,(7, 'Bathroom Hall')
        ,(8, 'Cafeteria Hall')
        ,(9, 'Maintenance Room')
        ,(10, 'Student Lounge Area')
        ,(11, 'Testing Center')
        ,(12, 'West Wing')
        ,(13, 'East Wing')
        ,(14, 'North Wing')
        ,(15, 'South Wing')

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: Fire Extinguisher Inspectors
-- -------------------------------------------------------------------------------------------------------
INSERT INTO TFireExInspectors (intFireExInspectorID, intInspectorID, intFireExID)
VALUES   (1, 1, 1)
        ,(2, 1, 2)
        ,(3, 2, 3)
        ,(4, 2, 4)
        ,(5, 3, 5)
        ,(6, 3, 6)
        ,(7, 4, 7)
        ,(8, 4, 8)
        ,(9, 5, 9)
        ,(10, 5, 10)
        ,(11, 6, 11)
        ,(12, 6, 12)

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: Fire Extinguisher Locations
-- -------------------------------------------------------------------------------------------------------
INSERT INTO TFireExLocations (intFireExLocationID, intLocationID, intFireExID)
VALUES   (1, 14, 1)
        ,(2, 13, 2)
        ,(3, 3, 3)
        ,(4, 4, 4)
        ,(5, 5, 5)
        ,(6, 6, 6)
        ,(7, 7, 7)
        ,(8, 8, 8)
        ,(9, 9, 9)
        ,(10, 10, 10)
        ,(11, 11, 11)
        ,(12, 12, 12)

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: Fire Extinguisher Facility Locations
-- -------------------------------------------------------------------------------------------------------
INSERT INTO TFireExFacilityLocations (intFireExFacilityLocationID, intFacilityID, intLocationID, intFireExID)
VALUES   (1, 1, 14, 1)
        ,(2, 1, 13, 2)
        ,(3, 1, 3, 3)
        ,(4, 2, 4, 4)
        ,(5, 2, 5, 5)
        ,(6, 2, 6, 6)
        ,(7, 3, 7, 7)
        ,(8, 3, 8, 8)
        ,(9, 3, 9, 9)
        ,(10, 4, 10, 10)
        ,(11, 4, 11, 11)
        ,(12, 4, 12, 12)

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: Standard Inspections
-- -------------------------------------------------------------------------------------------------------
INSERT INTO TStandardInspections (intStandardInspectionID, intStandardHoseInspectionID, intStandardHandleInspectionID, 
intStandardPressGuageInspectionID, intStandardCaseInspectionID, intStandardHousingInspectionID)
VALUES   (1, 1, 1, 1, 1, 1)
        ,(2, 1, 1, 1, 1, 1)
        ,(3, 2, 2, 2, 2, 2)
        ,(4, 2, 2, 2, 2, 2)
        ,(5, 3, 3, 3, 3, 3)
        ,(6, 3, 3, 3, 3, 3)
        ,(7, 4, 4, 4, 4, 4)
        ,(8, 4, 4, 4, 4, 4)
        ,(9, 5, 5, 5, 5, 5)
        ,(10, 5, 5, 5, 5, 5)
        ,(11, 1, 2, 3, 4, 5)
        ,(12, 5, 4, 3, 2, 1)

-- -------------------------------------------------------------------------------------------------------
-- Add Data To Table: Fire Extinguisher Inspections
-- -------------------------------------------------------------------------------------------------------
INSERT INTO TFireExInspections (intFireExInspectionID, intFireExID, intLocationID, intStandardInspectionID, 
intInspectorID, dtmLastInspectionDate, dtmNextInspectionDate)
VALUES   (1, 1, 2, 1, 1, '02/20/2023', '03/20/2023')
        ,(2, 2, 2, 2, 1, '02/20/2023', '03/20/2023')
        ,(3, 3, 3, 3, 2, '01/20/2023', '02/20/2023')
        ,(4, 4, 4, 4, 2, '02/20/2023', '03/20/2023')
        ,(5, 5, 5, 5, 3, '02/20/2023', '03/20/2023')
        ,(6, 6, 6, 6, 3, '02/20/2023', '03/20/2023')
        ,(7, 7, 7, 7, 4, '02/20/2023', '03/20/2023')
        ,(8, 8, 8, 8, 4, '01/20/2023', '02/20/2023')
        ,(9, 9, 9, 9, 5, '02/20/2023', '03/20/2023')
        ,(10, 10, 10, 10, 6, '01/20/2023', '02/20/2023')
        ,(11, 11, 11, 11, 6, '02/20/2023', '03/20/2023')
        ,(12, 12, 12, 12, 6, '02/20/2023', '03/20/2023')

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetInspectionStatus, which will return the inspection status from TInspectionStatus
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetInspectionStatus
    (@intInspectionStatusID int)
RETURNS VARCHAR(225)
AS
BEGIN
    DECLARE @InspectionStatus VARCHAR(225)
    SELECT @InspectionStatus = strInspectionStatusDesc
    FROM TInspectionStatus
    WHERE intInspectionStatusID = @intInspectionStatusID;
    RETURN @InspectionStatus;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetHose, which will return the hose length from THoses
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetHose
    (@intHoseID int)
RETURNS VARCHAR(225)
AS
BEGIN
    DECLARE @HoseLength VARCHAR(225)
    SELECT @HoseLength = strHoseLength
    FROM THoses
    WHERE intHoseID = @intHoseID;
    RETURN @HoseLength;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetHandle, which will return the handle type from THandles
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetHandle
    (@intHandleID int)
RETURNS VARCHAR(225)
AS
BEGIN
    DECLARE @HandleType VARCHAR(225)
    SELECT @HandleType = strHandleType
    FROM THandles
    WHERE intHandleID = @intHandleID;
    RETURN @HandleType;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetPressureType, which will return the pressure type from TPressGuageTypes
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetPressureType
    (@intPressGuageTypeID int)
RETURNS VARCHAR(225)
AS
BEGIN
    DECLARE @PressureType VARCHAR(225)
    SELECT @PressureType = strPressureType
    FROM TPressGuageTypes
    WHERE intPressGuageTypeID = @intPressGuageTypeID;
    RETURN @PressureType;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetPressureRange, which will return the pressure range from TPressGuageRanges
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetPressureRange
    (@intPressGuageRangeID int)
RETURNS VARCHAR(225)
AS
BEGIN
    DECLARE @PressureRange VARCHAR(225)
    SELECT @PressureRange = strPressureRange
    FROM TPressGuageRanges
    WHERE intPressGuageRangeID = @intPressGuageRangeID;
    RETURN @PressureRange;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetCaseWeight, which will return the case weight from TCaseWeights
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetCaseWeight
    (@intCaseWeightID int)
RETURNS VARCHAR(225)
AS
BEGIN
    DECLARE @CaseWeight VARCHAR(225)
    SELECT @CaseWeight = strCaseWeight
    FROM TCaseWeights
    WHERE intCaseWeightID = @intCaseWeightID;
    RETURN @CaseWeight;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetCaseAgent, which will return the case agent from TCaseAgents
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetCaseAgent
    (@intCaseAgentID int)
RETURNS VARCHAR(225)
AS
BEGIN
    DECLARE @CaseAgent VARCHAR(225)
    SELECT @CaseAgent = strCaseAgents
    FROM TCaseAgents
    WHERE intCaseAgentID = @intCaseAgentID;
    RETURN @CaseAgent;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetHousingDesc, which will return the housing information from THousings
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetHousingDesc
    (@intHousingID int)
RETURNS VARCHAR(225)
AS
BEGIN
    DECLARE @HousingDesc VARCHAR(225)
    SELECT @HousingDesc = strHousingDesc
    FROM THousings
    WHERE intHousingID = @intHousingID;
    RETURN @HousingDesc;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetInspectorName, which will return the inspector (last, first) names 
-- from TInspectors
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetInspectorName
    (@intInspectorID int)
RETURNS VARCHAR(225)

BEGIN
    DECLARE @InspectorName VARCHAR(225)
    SELECT @InspectorName = strLastName + ', ' + strFirstName
    FROM TInspectors
    WHERE intInspectorID = @intInspectorID;
    RETURN @InspectorName;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetInspectorEmail, which will return the inspector email
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetInspectorEmail
    (@intInspectorID int)
RETURNS VARCHAR(225)

BEGIN
    DECLARE @InspectorEmail VARCHAR(225)
    SELECT @InspectorEmail = strEmail
    FROM TInspectors
    WHERE intInspectorID = @intInspectorID;
    RETURN @InspectorEmail;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetUserLoginName, which will return the user login name from TLogins
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetUserLoginName
    (@intLoginID int)
RETURNS VARCHAR(225)
AS
BEGIN
    DECLARE @UserLoginName VARCHAR(225)
    SELECT @UserLoginName = strLoginName
    FROM TLogins
    -- WHERE intLoginID = @intLoginID;
    RETURN @UserLoginName;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetUserPassword, which will return the user password from TUserLogins
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetUserPassword
    (@intLoginID int)
RETURNS VARCHAR(225)
AS
BEGIN
    DECLARE @UserPassword VARCHAR(225)
    SELECT @UserPassword = strPassword
    FROM TLogins
    WHERE intLoginID = @intLoginID;
    RETURN @UserPassword;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetState, which will return the state name from TStates
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetState
    (@intStateID int)
RETURNS VARCHAR(225)
AS
BEGIN
    DECLARE @StateName VARCHAR(225)
    SELECT @StateName = strStateName
    FROM TStates
    WHERE intStateID = @intStateID;
    RETURN @StateName;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetFacilityName, which will return the facility name from TFacilities
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetFacilityName
    (@intFacilityID int)
RETURNS VARCHAR(225)
AS
BEGIN
    DECLARE @FacilityName VARCHAR(225)
    SELECT @FacilityName = strFacilityName
    FROM TFacilities
    WHERE intFacilityID = @intFacilityID;
    RETURN @FacilityName;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetFacilityAddress, which will return the facility address from TFacilities
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetFacilityAddress
    (@intFacilityID int)
RETURNS VARCHAR(225)
AS
BEGIN
    DECLARE @FacilityAddress VARCHAR(225)
    SELECT @FacilityAddress = strAddress
    FROM TFacilities
    WHERE intFacilityID = @intFacilityID;
    RETURN @FacilityAddress;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetFacilityZip, which will return the facility zip code from TFacilities
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetFacilityZip
    (@intFacilityID int)
RETURNS VARCHAR(225)
AS
BEGIN
    DECLARE @FacilityZip VARCHAR(225)
    SELECT @FacilityZip = strZip
    FROM TFacilities
    WHERE intFacilityID = @intFacilityID;
    RETURN @FacilityZip;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetFacilityPhoneNum, which will return the facility phone number from TFacilities
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetFacilityPhoneNum
    (@intFacilityID int)
RETURNS VARCHAR(225)
AS
BEGIN
    DECLARE @FacilityPhoneNum VARCHAR(225)
    SELECT @FacilityPhoneNum = strPhoneNum
    FROM TFacilities
    WHERE intFacilityID = @intFacilityID;
    RETURN @FacilityPhoneNum;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetLocationName, which will return the location name from TLocations
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetLocationName
    (@intLocationID int)
RETURNS VARCHAR(225)
AS
BEGIN
    DECLARE @LocationName VARCHAR(225)
    SELECT @LocationName = strLocationDesc
    FROM TLocations
    WHERE intLocationID = @intLocationID;
    RETURN @LocationName;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetFireExSerialNum, which will return the FireEx serial num from TFireEx
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetFireExSerialNum
    (@intFireExID int)
RETURNS VARCHAR(225)
AS
BEGIN
    DECLARE @FireExSerialNum VARCHAR(225)
    SELECT @FireExSerialNum = strSerialNum
    FROM TFireEx
    WHERE intFireExID = @intFireExID;
    RETURN @FireExSerialNum;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetFireExManuDate, which will return the FireEx Manufacture Date from TFireEx
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetFireExManuDate
    (@intFireExID int)
RETURNS DATE
AS
BEGIN
    DECLARE @FireExManuDate DATE
    SELECT @FireExManuDate = dtmManufactureDate
    FROM TFireEx
    WHERE intFireExID = @intFireExID;
    RETURN @FireExManuDate;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetFireExServiceDate, which will return the FireEx Service Date from TFireEx
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetFireExServiceDate
    (@intFireExID int)
RETURNS DATE
AS
BEGIN
    DECLARE @FireExServiceDate DATE
    SELECT @FireExServiceDate = dtmServiceDate
    FROM TFireEx
    WHERE intFireExID = @intFireExID;
    RETURN @FireExServiceDate;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetFireExReserviceDate, which will return the FireEx Re-service Date from TFireEx
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetFireExReserviceDate
    (@intFireExID int)
RETURNS DATE
AS
BEGIN
    DECLARE @FireExReserviceDate DATE
    SELECT @FireExReserviceDate = dtmReserviceDate
    FROM TFireEx
    WHERE intFireExID = @intFireExID;
    RETURN @FireExReserviceDate;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetFireExInstallDate, which will return the FireEx Install Date from TFireEx
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetFireExInstallDate
    (@intFireExID int)
RETURNS DATE
AS
BEGIN
    DECLARE @FireExInstallDate DATE
    SELECT @FireExInstallDate = dtmInstallationDate
    FROM TFireEx
    WHERE intFireExID = @intFireExID;
    RETURN @FireExInstallDate;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetFireExLastInspectDate, which will return the FireEx Last Inspection Date from TFireEx
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetFireExLastInspectDate
    (@intFireExID int)
RETURNS DATE
AS
BEGIN
    DECLARE @FireExLastInspectDate DATE
    SELECT @FireExLastInspectDate = dtmLastInspectionDate
    FROM TFireEx
    WHERE intFireExID = @intFireExID;
    RETURN @FireExLastInspectDate;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetFireExNextInspectDate, which will return the FireEx Next Inspection Date from TFireEx
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetFireExNextInspectDate
    (@intFireExID int)
RETURNS DATE
AS
BEGIN
    DECLARE @FireExNextInspectDate DATE
    SELECT @FireExNextInspectDate = dtmNextInspectionDate
    FROM TFireEx
    WHERE intFireExID = @intFireExID;
    RETURN @FireExNextInspectDate;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create Function: fn_GetFireExDeviceInUseStatus, which will return the FireEx device in use status from TFireEx
-- -------------------------------------------------------------------------------------------------------
GO

CREATE FUNCTION fn_GetFireExDeviceInUseStatus
    (@intFireExID int)
RETURNS VARCHAR(225)
AS
BEGIN
    DECLARE @FireExDeviceInUse VARCHAR(225)
    SELECT @FireExDeviceInUse = blnDeviceInUse
    FROM TFireEx
    WHERE intFireExID = @intFireExID;
    RETURN @FireExDeviceInUse;
END

GO

-- -------------------------------------------------------------------------------------------------------
-- Create View: Show all Inspectors by (lastname + firstname)
-- -------------------------------------------------------------------------------------------------------
GO

CREATE VIEW vInspectors (InspectorName)
AS
SELECT
    dbo.fn_GetInspectorName(intInspectorID) AS InspectorName

FROM
    TInspectors

GO

-- Display the Inspectors
SELECT * FROM vInspectors

-- -------------------------------------------------------------------------------------------------------
-- Create View: Show all Logins
-- -------------------------------------------------------------------------------------------------------
GO

CREATE VIEW vLogins (LoginName)
AS
SELECT
    dbo.fn_GetUserLoginName(intLoginID) AS LoginName

FROM
    TLogins

GO

-- -- Display all the login names
SELECT * FROM vLogins

-- -------------------------------------------------------------------------------------------------------
-- Create View: Show all Inspection Status
-- -------------------------------------------------------------------------------------------------------
GO

CREATE VIEW vInspectStatus (InspectionStatusDesc)
AS
SELECT
    dbo.fn_GetInspectionStatus(intInspectionStatusID)   AS InspectionStatusDesc

FROM
    TInspectionStatus

GO

-- -- Display the Inspection Status
SELECT * FROM vInspectStatus

-- -------------------------------------------------------------------------------------------------------
-- Create View: Show all Hose Lengths
-- -------------------------------------------------------------------------------------------------------
GO

CREATE VIEW vHosesLengths (HoseLength)
AS
SELECT
    dbo.fn_GetHose(intHoseID)   AS HoseLength

FROM
    THoses

GO

-- -- Display the Hose Lengths
SELECT * FROM vHosesLengths

-- -------------------------------------------------------------------------------------------------------
-- Create View: Show all Handle Types
-- -------------------------------------------------------------------------------------------------------
GO

CREATE VIEW vHandlesTypes (HandleType)
AS
SELECT
    dbo.fn_GetHandle(intHandleID)   AS HandleType

FROM
    THandles

GO

-- -- Display the Handle Types
SELECT * FROM vHandlesTypes

-- -------------------------------------------------------------------------------------------------------
-- Create View: Show all Pressure Guage information
-- -------------------------------------------------------------------------------------------------------
GO

CREATE VIEW vPressureGuages (PressureType, PressureRange)
AS
SELECT
    dbo.fn_GetPressureType(intPressGuageID)         AS PressureType
    ,dbo.fn_GetPressureRange(intPressGuageID)       AS PressureRange

FROM
    TPressureGuages

GO

-- -- Display all the information from the Pressure Guage table
SELECT * FROM vPressureGuages

-- -------------------------------------------------------------------------------------------------------
-- Create View: Show all Case information
-- -------------------------------------------------------------------------------------------------------
GO

CREATE VIEW vCaseComp (CaseWeight, CaseAgent)
AS
SELECT
    dbo.fn_GetCaseWeight(intCaseID) AS CaseWeight
    ,dbo.fn_GetCaseAgent(intCaseID) AS CaseAgent

FROM
    TCases

GO

-- -- Display all the information from the Case table
SELECT * FROM vCaseComp

-- -------------------------------------------------------------------------------------------------------
-- Create View: Show all Housing types
-- -------------------------------------------------------------------------------------------------------
GO

CREATE VIEW vHouseingDesc (HousingDesc)
AS
SELECT
    dbo.fn_GetHousingDesc(intHousingID) AS HousingDesc

FROM
    THousings

GO

-- -- Display all the Housing Types
SELECT * FROM vHouseingDesc

-- -------------------------------------------------------------------------------------------------------
-- Create View: Show all Facility information
-- -------------------------------------------------------------------------------------------------------
GO

CREATE VIEW vFacilityLocations (FacilityName, FacilityAddress, FacilityState, FacilityZip, FacilityPhoneNum)
AS
SELECT
    dbo.fn_GetFacilityName(TFL.intFacilityID)       AS FacilityName
    ,dbo.fn_GetFacilityAddress(TFL.intFacilityID)   AS FacilityAddress
    ,dbo.fn_GetState(TS.intStateID)                 AS FacilityState
    ,dbo.fn_GetFacilityZip(TFL.intFacilityID)       AS FacilityZip
    ,dbo.fn_GetFacilityPhoneNum(TFL.intFacilityID)  AS FacilityPhoneNum

FROM
    TFacilities AS TFL
    RIGHT JOIN TStates AS TS
    ON TS.intStateID = TFL.intStateID

WHERE
    TS.intStateID IN (SELECT TFL.intStateID FROM TFacilities AS TFL)

GROUP BY
    dbo.fn_GetFacilityName(TFL.intFacilityID)       
    ,dbo.fn_GetFacilityAddress(TFL.intFacilityID)  
    ,dbo.fn_GetState(TS.intStateID)                 
    ,dbo.fn_GetFacilityZip(TFL.intFacilityID)       
    ,dbo.fn_GetFacilityPhoneNum(TFL.intFacilityID)  

GO

-- -- Display all the Facility information
SELECT * FROM vFacilityLocations

-- -------------------------------------------------------------------------------------------------------
-- Create View: Show all Locations
-- -------------------------------------------------------------------------------------------------------
GO

CREATE VIEW vLocations (LocationName)
AS
SELECT
    dbo.fn_GetLocationName(intLocationID) AS LocationName

FROM
    TLocations

GO

-- -- Display all the Locations 
SELECT * FROM vLocations

-- -------------------------------------------------------------------------------------------------------
-- Create View: Show all Fire Extinguisher information
-- -------------------------------------------------------------------------------------------------------
GO

CREATE VIEW vFireEx (FireExSerialNum, ManuDate, ServiceDate, ReserviceDate, InstallDate, LastInspectionDate, 
NextInspectionDate, DeviceInUseStatus)
AS
SELECT
    dbo.fn_GetFireExSerialNum(intFireExID)          AS FireExSerialNum
    ,dbo.fn_GetFireExManuDate(intFireExID)          AS ManuDate
    ,dbo.fn_GetFireExServiceDate(intFireExID)       AS ServiceDate
    ,dbo.fn_GetFireExReserviceDate(intFireExID)     AS ReserviceDate
    ,dbo.fn_GetFireExInstallDate(intFireExID)       AS InstallDate
    ,dbo.fn_GetFireExLastInspectDate(intFireExID)   AS LastInspectionDate
    ,dbo.fn_GetFireExNextInspectDate(intFireExID)   AS NextInspectionDate
    ,dbo.fn_GetFireExDeviceInUseStatus(intFireExID) AS DeviceInUseStatus

FROM
    TFireEx

GO

-- -- Display all the Fire Extinguisher information
SELECT * FROM vFireEx

-- -------------------------------------------------------------------------------------------------------
-- Create View: Show all Fire Extinguisher date information
-- -------------------------------------------------------------------------------------------------------
GO

CREATE VIEW vFireExDates (FireExSerialNum, ManuDate, ServiceDate, ReserviceDate, InstallDate, LastInspectionDate, 
NextInspectionDate)
AS
SELECT
    dbo.fn_GetFireExSerialNum(intFireExID)          AS FireExSerialNum
    ,dbo.fn_GetFireExManuDate(intFireExID)          AS ManuDate
    ,dbo.fn_GetFireExServiceDate(intFireExID)       AS ServiceDate
    ,dbo.fn_GetFireExReserviceDate(intFireExID)     AS ReserviceDate
    ,dbo.fn_GetFireExInstallDate(intFireExID)       AS InstallDate
    ,dbo.fn_GetFireExLastInspectDate(intFireExID)   AS LastInspectionDate
    ,dbo.fn_GetFireExNextInspectDate(intFireExID)   AS NextInspectionDate

FROM
    TFireEx

GO

-- -- Display all the Fire Extinguisher date information
SELECT * FROM vFireExDates

-- -------------------------------------------------------------------------------------------------------
-- Create View: Show all Fire Extinguisher inspectors
-- -------------------------------------------------------------------------------------------------------
GO

CREATE VIEW vFireExInspectors (InspectorName, SerialNum)
AS
SELECT
    dbo.fn_GetInspectorName(TI.intInspectorID)          AS InspectorName
    ,dbo.fn_GetFireExSerialNum(TFX.intFireExID)         AS SerialNum

FROM
    TFireExInspectors AS TFXI
    RIGHT JOIN TInspectors AS TI 
    ON TI.intInspectorID = TFXI.intInspectorID

    RIGHT JOIN TFireEx AS TFX
    ON TFX.intFireExID = TFXI.intFireExID

WHERE 
    TI.intInspectorID IN (SELECT TFXI.intInspectorID FROM TFireExInspectors AS TFXI)
    AND TFX.intFireExID IN (SELECT TFXI.intFireExID FROM TFireExInspectors AS TFXI)

GROUP BY
    dbo.fn_GetInspectorName(TI.intInspectorID)          
    ,dbo.fn_GetFireExSerialNum(TFX.intFireExID)         

GO

-- -- Display all the Fire Extinguisher inspectors
SELECT * FROM vFireExInspectors

-- -------------------------------------------------------------------------------------------------------
-- Create View: Show all Fire Extinguisher locations 
-- -------------------------------------------------------------------------------------------------------
GO

CREATE VIEW vFireExLocations (LocationName, SerialNum)
AS
SELECT
    dbo.fn_GetLocationName(TL.intLocationID)            AS LocationName
    ,dbo.fn_GetFireExSerialNum(TFX.intFireExID)         AS SerialNum

FROM
    TFireExLocations AS TFXL
    RIGHT JOIN TLocations AS TL 
    ON TL.intLocationID = TFXL.intLocationID

    RIGHT JOIN TFireEx AS TFX
    ON TFX.intFireExID = TFXL.intFireExID

WHERE 
    TL.intLocationID IN (SELECT TFXL.intLocationID FROM TFireExLocations AS TFXL)
    AND TFX.intFireExID IN (SELECT TFXL.intFireExID FROM TFireExLocations AS TFXL)

GROUP BY
    dbo.fn_GetLocationName(TL.intLocationID)          
    ,dbo.fn_GetFireExSerialNum(TFX.intFireExID)       

GO

-- -- Display all the Fire Extinguisher inspectors
SELECT * FROM vFireExLocations

-- -------------------------------------------------------------------------------------------------------
-- Create View: Show all Fire Extinguisher locations at any facility  
-- -------------------------------------------------------------------------------------------------------
GO

CREATE VIEW vFireExFacilityLocation (FacilityName, LocationName, SerialNum)
AS
SELECT
    dbo.fn_GetFacilityName(TF.intFacilityID)            AS FacilityName
    ,dbo.fn_GetLocationName(TL.intLocationID)           AS LocationName
    ,dbo.fn_GetFireExSerialNum(TFX.intFireExID)         AS SerialNum

FROM
    TFireExFacilityLocations AS TFXFL
    RIGHT JOIN TLocations AS TL 
    ON TL.intLocationID = TFXFL.intLocationID

    RIGHT JOIN TFireEx AS TFX
    ON TFX.intFireExID = TFXFL.intFireExID

    RIGHT JOIN TFacilities as TF
    ON TF.intFacilityID = TFXFL.intFacilityID

WHERE 
    TL.intLocationID IN (SELECT TFXFL.intLocationID FROM TFireExLocations AS TFXL)
    AND TFX.intFireExID IN (SELECT TFXFL.intFireExID FROM TFireExLocations AS TFXL)
    AND TF.intFacilityID in (SELECT TFXFL.intFireExID FROM TFireExLocations AS TFXL)

GROUP BY
    dbo.fn_GetFacilityName(TF.intFacilityID) 
    ,dbo.fn_GetLocationName(TL.intLocationID)          
    ,dbo.fn_GetFireExSerialNum(TFX.intFireExID)       

GO

-- -- Display all the Fire Extinguisher locations at a facility
SELECT * FROM vFireExFacilityLocation

-- -------------------------------------------------------------------------------------------------------
-- Create View: Show all Fire Extinguisher inspection results
-- -------------------------------------------------------------------------------------------------------
GO

CREATE VIEW vFireExInspectResults (InspectorName, SerialNum, LocationName, HoseStatus, HandleStatus, PressureGuageStatus,
    CaseStatus, HousingStatus, LastInspectionDate, NextInspectionDate, ServiceDate, ReserviceDate)
AS
SELECT 
    dbo.fn_GetInspectorName(TFXIN.intInspectorID)               AS InspectorName
    ,dbo.fn_GetFireExSerialNum(TFXIN.intFireExID)               AS SerialNum
    ,dbo.fn_GetLocationName(TFXIN.intLocationID)                AS LocationName
    ,dbo.fn_GetInspectionStatus(TSHOIN.intInspectionStatusID)   AS HoseStatus
    ,dbo.fn_GetInspectionStatus(TSHLIN.intInspectionStatusID)   AS HandleStatus
    ,dbo.fn_GetInspectionStatus(TSPGIN.intInspectionStatusID)   AS PressureGuageStatus
    ,dbo.fn_GetInspectionStatus(TSCIN.intInspectionStatusID)    AS CaseStatus
    ,dbo.fn_GetInspectionStatus(TSHOSIN.intInspectionStatusID)  AS HousingStatus
    ,dbo.fn_GetFireExLastInspectDate(TFXIN.intFireExID)         AS LastInspectionDate
    ,dbo.fn_GetFireExNextInspectDate(TFXIN.intFireExID)         AS NextInspectionDate
    ,dbo.fn_GetFireExServiceDate(TFX.intFireExID)               AS ServiceDate
    ,dbo.fn_GetFireExReserviceDate(TFX.intFireExID)             AS ReserviceDate

FROM
    TFireExInspections AS TFXIN
    RIGHT JOIN TStandardInspections AS TSIN
    ON TSIN.intStandardInspectionID = TFXIN.intStandardInspectionID

    RIGHT JOIN TStandardHoseInspections AS TSHOIN
    ON TSHOIN.intStandardHoseInspectionID = TSIN.intStandardHoseInspectionID

    RIGHT JOIN TStandardHandleInspections AS TSHLIN
    ON TSHLIN.intStandardHandleInspectionID = TSIN.intStandardHandleInspectionID

    RIGHT JOIN TStandardPressGuageInspections AS TSPGIN
    ON TSPGIN.intStandardPressGuageInspectionID = TSIN.intStandardPressGuageInspectionID

    RIGHT JOIN TStandardCaseInspections AS TSCIN
    ON TSCIN.intStandardCaseInspectionID = TSIN.intStandardCaseInspectionID

    RIGHT JOIN TStandardHousingInspections AS TSHOSIN 
    ON TSHOSIN.intStandardHousingInspectionID = TSIN.intStandardHousingInspectionID

    RIGHT JOIN TInspectionStatus AS TINS 
    ON TINS.intInspectionStatusID = TSHOIN.intInspectionStatusID
    AND TINS.intInspectionStatusID = TSHLIN.intInspectionStatusID
    AND TINS.intInspectionStatusID = TSPGIN.intInspectionStatusID
    AND TINS.intInspectionStatusID = TSCIN.intInspectionStatusID
    AND TINS.intInspectionStatusID = TSHOSIN.intInspectionStatusID

    RIGHT JOIN TFireEx AS TFX
    ON TFX.intFireExID = TFXIN.intFireExID

WHERE 
    TFXIN.intFireExID IN (SELECT TFXIN.intFireExID FROM TFireExInspections AS TFXIN)

GROUP BY
    dbo.fn_GetInspectorName(TFXIN.intInspectorID)
    ,dbo.fn_GetFireExSerialNum(TFXIN.intFireExID)                  
    ,dbo.fn_GetLocationName(TFXIN.intLocationID)                                    
    ,dbo.fn_GetInspectionStatus(TSHOIN.intInspectionStatusID)    
    ,dbo.fn_GetInspectionStatus(TSHLIN.intInspectionStatusID)    
    ,dbo.fn_GetInspectionStatus(TSPGIN.intInspectionStatusID)    
    ,dbo.fn_GetInspectionStatus(TSCIN.intInspectionStatusID)    
    ,dbo.fn_GetInspectionStatus(TSHOSIN.intInspectionStatusID)    
    ,dbo.fn_GetFireExLastInspectDate(TFXIN.intFireExID)           
    ,dbo.fn_GetFireExNextInspectDate(TFXIN.intFireExID)           
    ,dbo.fn_GetFireExServiceDate(TFX.intFireExID)       
    ,dbo.fn_GetFireExReserviceDate(TFX.intFireExID)            

GO

-- -- Display all the Fire Extinguisher inspection results
SELECT * FROM vFireExInspectResults

-- -------------------------------------------------------------------------------------------------------
-- Create Stored Procedure: Add new Inspector
-- -------------------------------------------------------------------------------------------------------
GO

CREATE PROCEDURE uspAddNewInspector
    @intInspectorID                                  AS INTEGER OUTPUT              
    ,@strFirstName                                   AS VARCHAR(255)            
    ,@strLastName                                    AS VARCHAR(255)  
    ,@strEmail                                       AS VARCHAR(225) 

AS
SET NOCOUNT ON          -- Report only erros
SET XACT_ABORT ON       -- Terminate and roll back entire transaction on error
    
BEGIN TRANSACTION
    SELECT 
        @intInspectorID = MAX( intInspectorID ) + 1
    FROM
        TInspectors (TABLOCKX)  -- Lock table until end of transaction
    -- Default to 1 if table is empty
    SELECT  
        @intInspectorID = COALESCE( @intInspectorID, 1 )

    INSERT INTO
        TInspectors (intInspectorID, strFirstName, strLastName, strEmail)
    VALUES
        (@intInspectorID, @strFirstName, @strLastName, @strEmail)

COMMIT TRANSACTION

GO

-- TEST STORED PROCEDURE 
-- DECLARE @intInspectorID AS INTEGER = 0;
-- EXECUTE uspAddNewInspector @intInspectorID OUTPUT, 'Darth', 'Vader', 'Darth.Vader@email.com'
-- PRINT 'New Inspector ID = ' + CONVERT(VARCHAR, @intInspectorID)

-- -------------------------------------------------------------------------------------------------------
-- Create Stored Procedure: Add New Fire Extinguisher Inspector
-- -------------------------------------------------------------------------------------------------------
GO

CREATE PROCEDURE uspAddNewFireExInspector
    @intFireExInspectorID                           AS INTEGER OUTPUT              
    ,@intInspectorID                                AS INTEGER 
    ,@intFireExID                                   AS INTEGER  

AS
SET NOCOUNT ON          -- Report only erros
SET XACT_ABORT ON       -- Terminate and roll back entire transaction on error
    
BEGIN TRANSACTION
    SELECT 
        @intFireExInspectorID = MAX( intFireExInspectorID ) + 1
    FROM
        TFireExInspectors (TABLOCKX)  -- Lock table until end of transaction
    -- Default to 1 if table is empty
    SELECT  
        @intFireExInspectorID = COALESCE( @intFireExInspectorID, 1 )

    INSERT INTO
        TFireExInspectors (intFireExInspectorID, intInspectorID, intFireExID)
    VALUES
        (@intFireExInspectorID, @intInspectorID, @intFireExID)

COMMIT TRANSACTION

GO

-- TEST STORED PROCEDURE 
-- DECLARE @intFireExInspectorID AS INTEGER = 0;
-- EXECUTE uspAddNewFireExInspector @intFireExInspectorID OUTPUT, 3, 13
-- PRINT 'New Fire Extinguisher Inspector ID = ' + CONVERT(VARCHAR, @intFireExInspectorID)

-- -------------------------------------------------------------------------------------------------------
-- Create Stored Procedure: Add New Fire Extinguisher Location
-- -------------------------------------------------------------------------------------------------------
GO

CREATE PROCEDURE uspAddNewFireExLocation
    @intFireExLocationID                           AS INTEGER OUTPUT              
    ,@intLocationID                                AS INTEGER 
    ,@intFireExID                                  AS INTEGER  

AS
SET NOCOUNT ON          -- Report only erros
SET XACT_ABORT ON       -- Terminate and roll back entire transaction on error
    
BEGIN TRANSACTION
    SELECT 
        @intFireExLocationID = MAX( intFireExLocationID ) + 1
    FROM
        TFireExLocations (TABLOCKX)  -- Lock table until end of transaction
    -- Default to 1 if table is empty
    SELECT  
        @intFireExLocationID = COALESCE( @intFireExLocationID, 1 )

    INSERT INTO
        TFireExLocations (intFireExLocationID, intLocationID, intFireExID)
    VALUES
        (@intFireExLocationID, @intLocationID, @intFireExID)

COMMIT TRANSACTION

GO

-- TEST STORED PROCEDURE 
-- DECLARE @intFireExLocationID AS INTEGER = 0;
-- EXECUTE uspAddNewFireExLocation @intFireExLocationID OUTPUT, 3, 13
-- PRINT 'New Fire Extinguisher Location ID = ' + CONVERT(VARCHAR, @intFireExLocationID)

-- -------------------------------------------------------------------------------------------------------
-- Create Stored Procedure: Add New Fire Extinguisher Facility Location
-- -------------------------------------------------------------------------------------------------------
GO

CREATE PROCEDURE uspAddNewFireExFacilityLocation
    @intFireExFacilityLocationID                   AS INTEGER OUTPUT     
    ,@intFacilityID                                AS INTEGER         
    ,@intLocationID                                AS INTEGER 
    ,@intFireExID                                  AS INTEGER  

AS
SET NOCOUNT ON          -- Report only erros
SET XACT_ABORT ON       -- Terminate and roll back entire transaction on error
    
BEGIN TRANSACTION
    SELECT 
        @intFireExFacilityLocationID = MAX( intFireExFacilityLocationID ) + 1
    FROM
        TFireExFacilityLocations (TABLOCKX)  -- Lock table until end of transaction
    -- Default to 1 if table is empty
    SELECT  
        @intFireExFacilityLocationID = COALESCE( @intFireExFacilityLocationID, 1 )

    INSERT INTO
        TFireExFacilityLocations (intFireExFacilityLocationID, intFacilityID, intLocationID, intFireExID)
    VALUES
        (@intFireExFacilityLocationID, @intFacilityID, @intLocationID, @intFireExID)

COMMIT TRANSACTION

GO

-- TEST STORED PROCEDURE 
-- DECLARE @intFireExFacilityLocationID AS INTEGER = 0;
-- EXECUTE uspAddNewFireExFacilityLocation @intFireExFacilityLocationID OUTPUT, 3, 13, 13
-- PRINT 'New Facility Fire Extinguisher Location ID = ' + CONVERT(VARCHAR, @intFireExFacilityLocationID)

-- -------------------------------------------------------------------------------------------------------
-- Create Stored Procedure: Add new FireExUnit
-- -------------------------------------------------------------------------------------------------------
GO

CREATE PROCEDURE uspAddNewFireEx
    @intFireExID                                     AS INTEGER OUTPUT              
    ,@intCaseID                                      AS INTEGER            
    ,@strSerialNum                                   AS VARCHAR(255)            
    ,@dtmManufactureDate                             AS DATETIME
    ,@dtmServiceDate                                 AS DATETIME
    ,@dtmReserviceDate                               AS DATETIME
    ,@dtmInstallationDate                            AS DATETIME
    ,@dtmLastInspectionDate                          AS DATETIME
    ,@dtmNextInspectionDate                          AS DATETIME
    ,@blnDeviceInUse                                 AS VARCHAR(225)            

AS
SET NOCOUNT ON          -- Report only erros
SET XACT_ABORT ON       -- Terminate and roll back entire transaction on error

BEGIN TRANSACTION

    SELECT 
        @intFireExID = MAX( intFireExID ) + 1
    FROM
        TFireEx (TABLOCKX)  -- Lock table until end of transaction
    -- Default to 1 if table is empty
    SELECT  
        @intFireExID = COALESCE( @intFireExID, 1 )

    INSERT INTO
        TFireEx (intFireExID, intCaseID, strSerialNum, dtmManufactureDate, dtmServiceDate, 
        dtmReserviceDate, dtmInstallationDate, dtmLastInspectionDate, dtmNextInspectionDate, blnDeviceInUse)
    VALUES
        (@intFireExID, @intCaseID, @strSerialNum, @dtmManufactureDate, @dtmServiceDate, 
        @dtmReserviceDate, @dtmInstallationDate, @dtmLastInspectionDate, @dtmNextInspectionDate, @blnDeviceInUse)

COMMIT TRANSACTION

GO

-- TEST STORED PROCEDURE 
-- DECLARE @intFireExID AS INTEGER = 0;
-- EXECUTE uspAddNewFireEx @intFireExID OUTPUT, 11, 'Q-1010', '11/01/2022', '11/10/2022', 
-- '11/01/2023', '11/14/2022', '11/14/2022', '12/14/2022', 'TRUE'
-- PRINT 'New FireEx Unit ID = ' + CONVERT(VARCHAR, @intFireExID)

-- -------------------------------------------------------------------------------------------------------
-- Create Stored Procedure: Add new Location
-- -------------------------------------------------------------------------------------------------------
GO

CREATE PROCEDURE uspAddNewLocation
    @intLocationID                                  AS INTEGER OUTPUT              
    ,@strLocationDesc                               AS VARCHAR(255)                                  

AS
SET NOCOUNT ON          -- Report only erros
SET XACT_ABORT ON       -- Terminate and roll back entire transaction on error

BEGIN TRANSACTION
    SELECT 
        @intLocationID = MAX( intLocationID ) + 1
    FROM
        TLocations (TABLOCKX)  -- Lock table until end of transaction
    -- Default to 1 if table is empty
    SELECT  
        @intLocationID = COALESCE( @intLocationID, 1 )

    INSERT INTO
        TLocations (intLocationID, strLocationDesc)
    VALUES
        (@intLocationID, @strLocationDesc)

COMMIT TRANSACTION

GO

-- -- TEST STORED PROCEDURE 
-- DECLARE @intLocationID AS INTEGER = 0;
-- EXECUTE uspAddNewLocation @intLocationID OUTPUT, 'Basement'
-- PRINT 'New FireEx Location = ' + CONVERT(VARCHAR, @intLocationID)

-- -------------------------------------------------------------------------------------------------------
-- Create Stored Procedure: Add New Facility
-- -------------------------------------------------------------------------------------------------------
GO

CREATE PROCEDURE uspAddNewFacility
    @intFacilityID                              AS INTEGER OUTPUT              
    ,@strFacilityName                           AS VARCHAR(225)
    ,@strAddress                                AS VARCHAR(225)
    ,@intStateID                                AS INTEGER
    ,@strZip                                    AS VARCHAR(225)
    ,@strPhoneNum                               AS VARCHAR(225)

AS
SET NOCOUNT ON          -- Report only erros
SET XACT_ABORT ON       -- Terminate and roll back entire transaction on error

BEGIN TRANSACTION
    SELECT 
        @intFacilityID = MAX( intFacilityID ) + 1
    FROM
        TFacilities (TABLOCKX)  -- Lock table until end of transaction
    -- Default to 1 if table is empty
    SELECT  
        @intFacilityID = COALESCE( @intFacilityID, 1 )

    INSERT INTO
        TFacilities (intFacilityID, strFacilityName, strAddress, intStateID, strZip, strPhoneNum)
    VALUES
        (@intFacilityID, @strFacilityName, @strAddress, @intStateID, @strZip, @strPhoneNum)

COMMIT TRANSACTION

GO

-- -- TEST STORED PROCEDURE 
-- DECLARE @intLocationID AS INTEGER = 0;
-- EXECUTE uspAddNewFacility @intLocationID OUTPUT, 'Fort Something', '123 Fort Way', 1, '46523', '317-897-9234'
-- PRINT 'New Facility = ' + CONVERT(VARCHAR, @intLocationID)

-- -------------------------------------------------------------------------------------------------------
-- Create Stored Procedure: Add new Standard Hose Inspection
-- -------------------------------------------------------------------------------------------------------
GO

CREATE PROCEDURE uspAddNewStandardHoseInspection
    @intStandardHoseInspectionID                        AS INTEGER OUTPUT 
    ,@intHoseID                                         AS INTEGER 
    ,@intInspectionStatusID                             AS INTEGER                                                    

AS
SET NOCOUNT ON          -- Report only erros
SET XACT_ABORT ON       -- Terminate and roll back entire transaction on error

BEGIN TRANSACTION

    SELECT 
        @intStandardHoseInspectionID = MAX( intStandardHoseInspectionID ) + 1
    FROM
        TStandardHoseInspections (TABLOCKX)  -- Lock table until end of transaction
    -- Default to 1 if table is empty
    SELECT  
        @intStandardHoseInspectionID = COALESCE( @intStandardHoseInspectionID, 1 )

    INSERT INTO
        TStandardHoseInspections (intStandardHoseInspectionID, intHoseID, intInspectionStatusID)
    VALUES
        (@intStandardHoseInspectionID, @intHoseID, @intInspectionStatusID)

COMMIT TRANSACTION

GO

-- -- TEST STORED PROCEDURE 
-- DECLARE @intStandardHoseInspectionID AS INTEGER = 0;
-- EXECUTE uspAddNewStandardHoseInspection @intStandardHoseInspectionID OUTPUT, 1, 2
-- PRINT 'New Standard Hose Inspection ID = ' + CONVERT(VARCHAR, @intStandardHoseInspectionID)

-- -------------------------------------------------------------------------------------------------------
-- Create Stored Procedure: Add new Handle Standard Inspection
-- -------------------------------------------------------------------------------------------------------
GO

CREATE PROCEDURE uspAddNewStandardHandleInspection
    @intStandardHandleInspectionID                      AS INTEGER OUTPUT 
    ,@intHandleID                                       AS INTEGER    
    ,@intInspectionStatusID                             AS INTEGER                                                    

AS
SET NOCOUNT ON          -- Report only erros
SET XACT_ABORT ON       -- Terminate and roll back entire transaction on error

BEGIN TRANSACTION

    SELECT 
        @intStandardHandleInspectionID = MAX( intStandardHandleInspectionID ) + 1
    FROM
        TStandardHandleInspections (TABLOCKX)  -- Lock table until end of transaction
    -- Default to 1 if table is empty
    SELECT  
        @intStandardHandleInspectionID = COALESCE( @intStandardHandleInspectionID, 1 )

    INSERT INTO
        TStandardHandleInspections (intStandardHandleInspectionID, intHandleID, intInspectionStatusID)
    VALUES
        (@intStandardHandleInspectionID, @intHandleID, @intInspectionStatusID)

COMMIT TRANSACTION

GO

-- -- TEST STORED PROCEDURE 
-- DECLARE @intStandardHandleInspectionID AS INTEGER = 0;
-- EXECUTE uspAddNewStandardHandleInspection @intStandardHandleInspectionID OUTPUT, 2, 2
-- PRINT 'New Standard Handle Inspection ID = ' + CONVERT(VARCHAR, @intStandardHandleInspectionID)

-- -------------------------------------------------------------------------------------------------------
-- Create Stored Procedure: Add new Pressure Guage Standard Inspection
-- -------------------------------------------------------------------------------------------------------
GO

CREATE PROCEDURE uspAddNewStandardPressGuagueInspection
    @intStandardPressGuageInspectionID                     AS INTEGER OUTPUT 
    ,@intPressGuageID                                       AS INTEGER  
    ,@intInspectionStatusID                                 AS INTEGER                                                    

AS
SET NOCOUNT ON          -- Report only erros
SET XACT_ABORT ON       -- Terminate and roll back entire transaction on error

BEGIN TRANSACTION

    SELECT 
        @intStandardPressGuageInspectionID = MAX( intStandardPressGuageInspectionID ) + 1
    FROM
        TStandardPressGuageInspections (TABLOCKX)  -- Lock table until end of transaction
    -- Default to 1 if table is empty
    SELECT  
        @intStandardPressGuageInspectionID = COALESCE( @intStandardPressGuageInspectionID, 1 )

    INSERT INTO
        TStandardPressGuageInspections (intStandardPressGuageInspectionID, intPressGuageID, intInspectionStatusID)
    VALUES
        (@intStandardPressGuageInspectionID, @intPressGuageID, @intInspectionStatusID)

COMMIT TRANSACTION

GO

-- -- TEST STORED PROCEDURE 
-- DECLARE @intStandardPressGuageInspectionID AS INTEGER = 0;
-- EXECUTE uspAddNewStandardPressGuagueInspection @intStandardPressGuageInspectionID OUTPUT, 2, 4
-- PRINT 'New Standard Pressure Guage Inspection ID = ' + CONVERT(VARCHAR, @intStandardCaseHousingInspectionID)

-- -------------------------------------------------------------------------------------------------------
-- Create Stored Procedure: Add new Standard Case Inspection
-- -------------------------------------------------------------------------------------------------------
GO

CREATE PROCEDURE uspAddNewStandardCaseInspection
    @intStandardCaseInspectionID                        AS INTEGER OUTPUT          
    ,@intCaseID                                         AS INTEGER                
    ,@intInspectionStatusID                             AS INTEGER                                                                 

AS
SET NOCOUNT ON          -- Report only erros
SET XACT_ABORT ON       -- Terminate and roll back entire transaction on error

BEGIN TRANSACTION
    SELECT 
        @intStandardCaseInspectionID = MAX( @intStandardCaseInspectionID ) + 1
    FROM
        TStandardCaseInspections (TABLOCKX)  -- Lock table until end of transaction
    -- Default to 1 if table is empty
    SELECT  
        @intStandardCaseInspectionID = COALESCE( @intStandardCaseInspectionID, 1 )

    INSERT INTO
        TStandardCaseInspections (intStandardCaseInspectionID, intCaseID, intInspectionStatusID)
    VALUES
        (@intStandardCaseInspectionID, @intCaseID, @intInspectionStatusID)

COMMIT TRANSACTION

GO

-- -- TEST STORED PROCEDURE 
-- DECLARE @intStandardCaseInspectionID AS INTEGER = 0;
-- EXECUTE uspAddNewStandardCaseInspection @intStandardCaseInspectionID OUTPUT, 1, 9
-- PRINT 'New Standard Case ID = ' + CONVERT(VARCHAR, @intStandardCaseInspectionID)

-- -------------------------------------------------------------------------------------------------------
-- Create Stored Procedure: Add new Brake Housing Physical Inspection
-- -------------------------------------------------------------------------------------------------------
GO

CREATE PROCEDURE uspAddNewStandardHousingInspection
    @intStandardHousingInspectionID                     AS INTEGER OUTPUT          
    ,@intHousingID                                      AS INTEGER                
    ,@intInspectionStatusID                             AS INTEGER                                                                 

AS
SET NOCOUNT ON          -- Report only erros
SET XACT_ABORT ON       -- Terminate and roll back entire transaction on error

BEGIN TRANSACTION
    SELECT 
        @intStandardHousingInspectionID = MAX( intStandardHousingInspectionID ) + 1
    FROM
        TStandardHousingInspections (TABLOCKX)  -- Lock table until end of transaction
    -- Default to 1 if table is empty
    SELECT  
        @intStandardHousingInspectionID = COALESCE( @intStandardHousingInspectionID, 1 )

    INSERT INTO
        TStandardHousingInspections (intStandardHousingInspectionID, intHousingID, intInspectionStatusID)
    VALUES
        (@intStandardHousingInspectionID, @intHousingID, @intInspectionStatusID)

COMMIT TRANSACTION

GO

-- -- TEST STORED PROCEDURE 
-- DECLARE @intStandardHousingInspectionID AS INTEGER = 0;
-- EXECUTE uspAddNewStandardHousingInspection @intStandardHousingInspectionID OUTPUT, 2, 4
-- PRINT 'New Standard Housing Inspection ID = ' + CONVERT(VARCHAR, @intStandardHousingInspectionID)

-- -------------------------------------------------------------------------------------------------------
-- Create Stored Procedure: Add new Standard Inspection
-- -------------------------------------------------------------------------------------------------------
GO

CREATE PROCEDURE uspAddNewStandardInspection
    @intStandardInspectionID                            AS INTEGER OUTPUT 
    ,@intStandardHoseInspectionID                       AS INTEGER 
    ,@intStandardHandleInspectionID                     AS INTEGER  
    ,@intStandardPressGuageInspectionID                 AS INTEGER   
    ,@intStandardCaseInspectionID                       AS INTEGER 
    ,@intStandardHousingInspectionID                    AS INTEGER       
                                           
AS
SET NOCOUNT ON          -- Report only erros
SET XACT_ABORT ON       -- Terminate and roll back entire transaction on error

BEGIN TRANSACTION

    SELECT 
        @intStandardInspectionID = MAX( intStandardInspectionID ) + 1
    FROM
        TStandardInspections (TABLOCKX)  -- Lock table until end of transaction
    -- Default to 1 if table is empty
    SELECT  
        @intStandardInspectionID = COALESCE( @intStandardInspectionID, 1 )

    INSERT INTO
        TStandardInspections (intStandardInspectionID, intStandardHoseInspectionID, intStandardHandleInspectionID, 
        intStandardPressGuageInspectionID, intStandardCaseInspectionID, intStandardHousingInspectionID)
    VALUES
        (@intStandardInspectionID, @intStandardHoseInspectionID, @intStandardHandleInspectionID, 
        @intStandardPressGuageInspectionID, @intStandardCaseInspectionID, @intStandardHousingInspectionID)

COMMIT TRANSACTION

GO

-- -- TEST STORED PROCEDURE 
-- DECLARE @intStandardInspectionID AS INTEGER = 0;
-- EXECUTE uspAddNewStandardInspection @intStandardInspectionID OUTPUT, 1, 2, 3, 4, 5
-- PRINT 'New Standard Inspection ID = ' + CONVERT(VARCHAR, @intStandardInspectionID)

-- -------------------------------------------------------------------------------------------------------
-- Create Stored Procedure: Add new FireEx Inspection
-- -------------------------------------------------------------------------------------------------------
GO

CREATE PROCEDURE uspAddNewFireExInspection
    @intFireExInspectionID                              AS INTEGER OUTPUT 
    ,@intFireExID                                       AS INTEGER 
    ,@intLocationID                                     AS INTEGER  
    ,@intStandardInspectionID                           AS INTEGER   
    ,@intInspectorID                                    AS INTEGER 
    -- ,@dtmLastInspectionDate                             AS DATETIME
    -- ,@dtmNextInspectionDate                             AS DATETIME
   
AS
SET NOCOUNT ON          -- Report only erros
SET XACT_ABORT ON       -- Terminate and roll back entire transaction on error

BEGIN TRANSACTION 
    DECLARE @NOW DATETIME
    SET @NOW = GETDATE()
    DECLARE @NEXT DATETIME
    SET @NEXT = @NOW + 30

    SELECT 
        @intFireExInspectionID = MAX( intFireExInspectionID ) + 1
    FROM
        TFireExInspections (TABLOCKX)  -- Lock table until end of transaction
    -- Default to 1 if table is empty
    SELECT  
        @intFireExInspectionID = COALESCE( @intFireExInspectionID, 1 )

    INSERT INTO
        TFireExInspections (intFireExInspectionID, intFireExID, intLocationID, intStandardInspectionID,
        intInspectorID, dtmLastInspectionDate, dtmNextInspectionDate)
    VALUES
        (@intFireExInspectionID, @intFireExID, @intLocationID, @intStandardInspectionID,
        @intInspectorID, @NOW, @NEXT)

COMMIT TRANSACTION

GO

-- TEST STORED PROCEDURE 
-- DECLARE @intFireExInspectionID AS INTEGER = 0;
-- EXECUTE uspAddNewFireExInspection @intFireExInspectionID OUTPUT, 1, 2, 3, 4 --, '01/25/2023', '02/02/2023'
-- PRINT 'New Fire Extingusher Inspection ID = ' + CONVERT(VARCHAR, @intFireExInspectionID)

-- -------------------------------------------------------------------------------------------------------
-- Create Stored Procedure: Add new State
-- -------------------------------------------------------------------------------------------------------
GO

CREATE PROCEDURE uspAddNewState
    @intStateID                                     AS INTEGER OUTPUT          
    ,@strStateName                                  AS VARCHAR(225)                
                                                               
AS
SET NOCOUNT ON          -- Report only erros
SET XACT_ABORT ON       -- Terminate and roll back entire transaction on error

BEGIN TRANSACTION
    SELECT 
        @intStateID = MAX( intStateID ) + 1
    FROM
        TStates (TABLOCKX)  -- Lock table until end of transaction
    -- Default to 1 if table is empty
    SELECT  
        @intStateID = COALESCE( @intStateID, 1 )
    INSERT INTO
        TStates (intStateID, strStateName)
    VALUES
        (@intStateID, @strStateName)

COMMIT TRANSACTION

GO

-- -- TEST STORED PROCEDURE 
-- DECLARE @intStateID AS INTEGER = 0;
-- EXECUTE uspAddNewState @intStateID OUTPUT, 'Illinois'
-- PRINT 'New State ID = ' + CONVERT(VARCHAR, @intStateID)

-- -------------------------------------------------------------------------------------------------------
-- Create Stored Procedure: Add New Login Name
-- -------------------------------------------------------------------------------------------------------
GO

CREATE PROCEDURE uspAddNewLogin
    @intLoginID                                     AS INTEGER OUTPUT              
    ,@strLoginName                                  AS VARCHAR(225)
    ,@strPassword                                   AS VARCHAR(225)
                                                               
AS
SET NOCOUNT ON          -- Report only erros
SET XACT_ABORT ON       -- Terminate and roll back entire transaction on error

BEGIN TRANSACTION
    SELECT 
        @intLoginID = MAX( intLoginID ) + 1
    FROM
        TLogins (TABLOCKX)  -- Lock table until end of transaction
    -- Default to 1 if table is empty
    SELECT  
        @intLoginID = COALESCE( @intLoginID, 1 )
    INSERT INTO
        TLogins (intLoginID, strLoginName, strPassword)
    VALUES
        (@intLoginID, @strLoginName, @strPassword)

COMMIT TRANSACTION

GO

-- -- TEST STORED PROCEDURE 
-- DECLARE @intLoginID AS INTEGER = 0;
-- EXECUTE uspAddNewLogin @intLoginID OUTPUT, 'Darth.Vader', 'weoi28345haghn'
-- PRINT 'New Login ID = ' + CONVERT(VARCHAR, @intLoginID)

-- -------------------------------------------------------------------------------------------------------
-- Create Stored Procedure: Add New Login Name and password
-- -------------------------------------------------------------------------------------------------------
GO

CREATE PROCEDURE uspAddNewUserLogin
    @intUserLoginID                                 AS INTEGER OUTPUT              
    ,@intInspectorID                                AS INTEGER
    ,@intLoginID                                    AS INTEGER

AS
SET NOCOUNT ON          -- Report only erros
SET XACT_ABORT ON       -- Terminate and roll back entire transaction on error

BEGIN TRANSACTION

    SELECT 
        @intUserLoginID = MAX( intUserLoginID ) + 1
    FROM
        TUserLogins (TABLOCKX)  -- Lock table until end of transaction
    -- Default to 1 if table is empty
    SELECT  
        TUserLogins = COALESCE( @intUserLoginID, 1 )
    INSERT INTO
        TUserLogins (intUserLoginID, intInspectorID, intLoginID)
    VALUES
        (@intUserLoginID, @intInspectorID, @intLoginID)

COMMIT TRANSACTION

GO

-- -- TEST STORED PROCEDURE 
-- DECLARE @intUserLoginID AS INTEGER = 0;
-- EXECUTE uspAddNewUserLogin @intUserLoginID OUTPUT, 6, 6
-- PRINT 'New User Login ID = ' + CONVERT(VARCHAR, @intUserLoginID)

-- -------------------------------------------------------------------------------------------------------
-- Create Stored Procedure: Update FireEx Device
-- -------------------------------------------------------------------------------------------------------
GO

CREATE PROCEDURE uspUpdateFireExDevice
    @intFireExID                                     AS INTEGER OUTPUT                       
    ,@dtmLastInspectionDate                          AS DATETIME
    ,@dtmNextInspectionDate                          AS DATETIME
    ,@blnDeviceInUse                                 AS VARCHAR(225)            

AS
SET NOCOUNT ON          -- Report only erros
SET XACT_ABORT ON       -- Terminate and roll back entire transaction on error

BEGIN TRANSACTION
    DECLARE @ModifiedReason AS VARCHAR(1000) = 'Updated Due To User Performing A New Inspection'
   
    UPDATE 
        TFireEx 
    SET
        dtmLastInspectionDate = @dtmLastInspectionDate,
        dtmNextInspectionDate = @dtmNextInspectionDate,
        blnDeviceInUse = @blnDeviceInUse,
        strModifiedReason = @ModifiedReason
    WHERE 
        intFireExID = @intFireExID 

COMMIT TRANSACTION

GO

-- TEST STORED PROCEDURE 
-- DECLARE @intFireExID AS INTEGER = 13;
-- EXECUTE uspUpdateFireExDevice @intFireExID OUTPUT, '01/25/2023', '02/02/2023', 'TRUE'
-- PRINT 'Updated FireEx ID = ' + CONVERT(VARCHAR, @intFireExID)

-- -------------------------------------------------------------------------------------------------------
-- Create Stored Procedure: Update Fire Extinguisher Device
-- -------------------------------------------------------------------------------------------------------
GO

CREATE PROCEDURE uspUpdate_FireEx
    @intFireExID                                     AS INTEGER OUTPUT                         
    ,@dtmManufactureDate                             AS DATETIME
    ,@dtmServiceDate                                 AS DATETIME
    ,@dtmReserviceDate                               AS DATETIME
    ,@dtmInstallationDate                            AS DATETIME     
    ,@blnDeviceInUse                                 AS VARCHAR(225)             

AS
SET NOCOUNT ON          -- Report only erros
SET XACT_ABORT ON       -- Terminate and roll back entire transaction on error

BEGIN TRANSACTION
    DECLARE @ModifiedReason AS VARCHAR(1000) = 'Updated Due To User Request'
   
    UPDATE 
        TFireEx 
    SET
        dtmManufactureDate = @dtmManufactureDate,
        dtmServiceDate = @dtmServiceDate,
        dtmReserviceDate = @dtmReserviceDate,
        dtmInstallationDate = @dtmInstallationDate,
        blnDeviceInUse = @blnDeviceInUse,
        strModifiedReason = @ModifiedReason
    WHERE 
        intFireExID = @intFireExID 

COMMIT TRANSACTION

GO

-- TEST STORED PROCEDURE 
-- DECLARE @intFireExID AS INTEGER = 12;
-- EXECUTE uspUpdate_FireEx @intFireExID OUTPUT, '12/25/2022', '1/02/2023', '1/02/2024', '01/25/2023', '02/02/2023', 'TRUE'
-- PRINT 'Updated FireEx ID = ' + CONVERT(VARCHAR, @intFireExID)
