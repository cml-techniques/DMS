using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using App_Properties;
using DataLinkLibrary;

namespace BusinessLogic
{
    
    public class BLL_Dml
    {
        DLL_Dml _objDLL = new DLL_Dml();
       
        public bool _validUser(_clsuser _obj, _database _objdb)
        {
            return _objDLL._validUser("ChkUserLogin", _obj,_objdb);
        }
        public void UpdateUserLog(_clslog _obj, _database _objdb)
        {
            _objDLL.UpdateUserLog("UpdateUserLog", _obj, _objdb);
        }
        public DataTable LoadDMSUserLog(_database _objdb)
        {
            return _objDLL.load_master("LoadDMSUserLog", _objdb);
        }
        public DataTable load_service(_clsuser _obj, _database _objdb)
        {
            return _objDLL.load_service("loadservice",_obj,_objdb);
        }
        public DataTable load_package(_database _objdb)
        {
            return _objDLL.load_master("loadpackage",_objdb);
        }
       
        public DataTable load_doctype(_database _objdb)
        {
            return _objDLL.load_master("loaddoctype",_objdb);
        }
        
        public DataTable load_subgroup(_database _objdb)
        {
            return _objDLL.load_master("loadsubgroup",_objdb);
        }
        public DataTable load_subgroup1(_database _objdb)
        {
            return _objDLL.load_master("loadsubgroup1",_objdb);
        }
        public DataTable load_group(_database _objdb)
        {
            return _objDLL.load_master("loadgroup",_objdb);
        }
        
        public void addcomment(_clscomment _obj, _database _objdb)
        {
            _objDLL.addcomment("addcomment", _obj,_objdb);
        }
       
        public void Deletecomment(_clscomment _obj, _database _objdb)
        {
            _objDLL.Deletecomment("deletecomment", _obj, _objdb);
        }
        public DataTable load_comments(_clsdocument _obj, _database _objdb)
        {
           return _objDLL.load_comments("loadcomments", _obj,_objdb);
        }
        public DataTable load_usercomments(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.load_usercomments("load_usercomments", _obj, _objdb);
        }
      
        public DataTable load_schedule(_clsuser _obj, _database _objdb)
        {
            return _objDLL.load_master ("LoadSchedule",_obj,_objdb);
        }
        public void file_upload(_clsdocument _obj, _database _objdb)
        {
            _objDLL.file_upload("FileUploading", _obj,_objdb);
        }
      
        public void Create_Schedule(_clsdocument _obj, _database _objdb)
        {
            _objDLL.Create_Schedule("CreateSchedule", _obj,_objdb);
        }
       
       
        //--------------------Created on 15/03/2011-----------------//
     
        public void Create_Manufacture(_clsmanufacture _obj, _database _objdb)
        {
            _objDLL.Create_Manufacture("CreateManufacture", _obj,_objdb);
        }
        public DataTable load_manufacturer(_clsuser _obj, _database _objdb)
        {
            return _objDLL.load_master("LoadManufacture", _obj,_objdb);
        }
      
        public void Move_document(_clsdocument _obj, _database _objdb)
        {
            _objDLL.Move_document("Manage_document", _obj,_objdb);
        }
      
        public void SetDocDuration(_clsdocduration _obj, _database _objdb)
        {
            _objDLL.SetDocDuration("SetDocDuration", _obj,_objdb);
        }
       
        public DataTable LoadDocDatails(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.LoadDocDatails("LoadDocumentDetails", _obj,_objdb);
        }
       
        public string GetAutoPassword(_clsuser _obj, _database _objdb)
        {
            return _objDLL.GetAutoPassword("GetAutoPassword", _obj,_objdb);
        }
       
        public void Create_Contractor(_clsmanufacture _obj, _database _objdb)
        {
            _objDLL.Create_Contractor("CreateContractor", _obj,_objdb);
        }
        public DataTable load_Contractor(_clsuser _obj, _database _objdb)
        {
            return _objDLL.load_master("LoadContractor", _obj,_objdb);
        }
        public DataTable Load_DocDatails(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Load_DocDatails("Load_OMManualDetailsRPT", _obj,_objdb);
        }
       
        public DataTable Load_cas_sys(_clscassheet _obj, _database _objdb)
        {
            return _objDLL.Load_cas_sys("load_cms_cas_sys", _obj,_objdb);
        }
       
        public DataTable Load_casMain_Edit(_clscassheet _obj, _database _objdb)
        {
            return _objDLL.Load_casMain_Edit("load_casMain_Edit", _obj,_objdb);
        }
       
        public string ChkUserLoggedIN(_clsuser _obj, _database _objdb)
        {
            return _objDLL.ChkUserLoggedIN("ChkUserLoggedIN", _obj,_objdb);
        }
       
        public DataTable load_commentbasket(_clscomment _obj, _database _objdb)
        {
            return _objDLL.load_comment_basket("load_comment_basket", _obj,_objdb);
        }
        public void Remove_basket(_clscomment _obj, _database _objdb)
        {
            _objDLL.Remove_basket("remove_comment_basket", _obj,_objdb);
        }
       
        public void Cassheet_Master(_clscassheet _obj, _database _objdb)
        {
            _objDLL.Cassheet_Master("insert_Cassheet_master", _obj,_objdb);
        }
       
        public DataTable Load_SubFolder(_clsFolderTree _obj, _database _objdb)
        {
            return _objDLL.Load_SubFolder("load_cassheet_folder", _obj,_objdb);
        }
        
        public DataTable Load_Prj_Main_Module(_database _objdb)
        {
            return _objDLL.load_master("LOAD_PRJ_MAIN_MODULES", _objdb);
        }
        public DataTable Load_Prj_Service(_database _objdb)
        {
            return _objDLL.load_master("LOAD_PRJ_SERVICE", _objdb);
        }
        public DataTable Load_Prj_Cassheet(_database _objdb)
        {
            return _objDLL.load_master("LOAD_PRJ_CASSHEET", _objdb);
        }
        
        public DataTable Load_Company_Master( _database _objdb)
        {
            return _objDLL.load_master("Load_Com_Master", _objdb);
        }
        
        public void Delete_Schedule(_clsdocument _obj, _database _objdb)
        {
            _objDLL.Delete_Schedule("Delete_Schedule", _obj, _objdb);
        }
        public int Get_Seq(_clscassheet _obj, _database _objdb)
        {
            return _objDLL.Get_Seq("Get_SeqNo", _obj, _objdb);
        }
        public int Get_Position(_clscassheet _obj, _database _objdb)
        {
            return _objDLL.Get_Position("Get_Position", _obj, _objdb);
        }
        
        public DataTable Load_Flvl(_database _objdb)
        {
            return _objDLL.load_master("Load_FLvl", _objdb);
        }
        
        public int Check_EngRef(_clscassheet _obj, _database _objdb)
        {
            return _objDLL.Check_EngRef("Check_EngRef", _obj, _objdb);
        }
        
        public int Get_SysId( _clscassheet _obj, _database _objdb)
        {
            return _objDLL.Get_SysId("Get_SysId", _obj, _objdb);
        }
        
        public string Get_User_Permission(_clsuser _obj, _database _objdb)
        {
            return _objDLL.Get_User_Permission("Get_User_Permission", _obj, _objdb);
        }
        
        public string Get_ProjectName(_clsuser _obj, _database _objdb)
        {
            return _objDLL.Get_ProjectName("Get_ProjectName", _obj, _objdb);
        }
        
        public void DML_Manufacturer(_clsams _obj, _database _objdb)
        {
            _objDLL.DML_Manufacturer("DML_Manufacturer", _obj, _objdb);
        }
        public DataTable Load_Manufacturer(_database _objdb)
        {
            return _objDLL.load_master("Load_manufacturer", _objdb);
        }
        
        public DataTable Load_ScheduleList(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Load_ScheduleList("LoadSchedule_List", _obj, _objdb);
        }
        
        public void AMS_Register(_clsams _obj, _database _objdb)
        {
            _objDLL.AMS_Register("DML_AssetRegister", _obj, _objdb);
        }
        public string Get_Category(_clscassheet _obj, _database _objdb)
        {
            return _objDLL.Get_Category("Get_Cate", _obj, _objdb);
        }
              
        public DataTable load_dms_user_email(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.load_dms_user_email("Load_dms_User_email", _obj, _objdb);
        }
        
        public int get_schedule_possition(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.get_schedule_possition("Get_Schedule_Possition", _obj, _objdb);
        }
            
        public DataTable LOAD_PROJECT_MODULE(_clsproject _obj, _database _objdb)
        {
            return _objDLL.LOAD_PROJECT_MODULE("LOAD_PROJECTS_MODULE", _obj, _objdb);
        }
        
        public void Delete_DMS_Doc(_clsdocument _obj, _database _objdb)
        {
            _objDLL.Delete_Doc("Delete_DMS_Document", _obj, _objdb);
        }
        public string Get_UserName(_clsuser _obj, _database _objdb)
        {
            return _objDLL.Get_UserName("Get_UserName", _obj, _objdb);
        }
       
        public int Get_Servicefolder(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Get_Package_Service("Get_Servicefolder", _obj, _objdb);
        }
        
        public DataTable load_documentsFolderBased(_clstreefolder _obj, _database _objdb)
        {
            return _objDLL.Get_Folder_Details("load_AlldocumentsFolderBased", _obj, _objdb);
        }

        public DataTable Get_ProjectInformation(_clsproject _obj, _database _objdb)
        {
            return _objDLL.Get_ProjectInformation("Get_ProjectInformation", _obj, _objdb);
        }
        public int Get_DefaultService(_database _objdb)
        {
            return _objDLL.Get_Default("Get_DefaultService", _objdb);
        }
        public int Get_DefaultCassheet(_database _objdb)
        {
            return _objDLL.Get_Default("Get_DefaultCassheet", _objdb);
        }
        public DataTable load_AllDocumentsDirectFolder(_clstreefolder _obj, _database _objdb)   
        {
            return _objDLL.Get_Folder_Details("load_AllDocumentsDirectFolder", _obj, _objdb);
        }

        public DataTable Get_Folder_Description(_clstreefolder _obj, _database _objdb)
        {
            return _objDLL.Get_Folder_Details("Get_folderdesc", _obj, _objdb);
        }
        
        public DataTable Load_AllsubFolders(_clstreefolder _obj, _database _objdb)
        {
            return _objDLL.Get_Folder_Details("load_AllsubFolders", _obj, _objdb);
        }
        public DataTable Get_DafaultMenuFolder(_clsuser _obj, _database _objdb)
        {
            return _objDLL.load_service("Get_DafaultMenuFolder", _obj, _objdb);
        }
        public DataTable Get_DafaultNavFolder(_clstreefolder _obj, _database _objdb)
        {
            return _objDLL.Get_Folder_Details("Get_DafaultNavFolder", _obj, _objdb);
        }
        public DataTable Get_folderProjectdescription1(_clstreefolder _obj, _database _objdb)
        {
            return _objDLL.Get_Folder_Details("Get_folderProjectdescription", _obj, _objdb);
        }
        public DataTable Get_CurrentUploadFolder(_clstreefolder _obj, _database _objdb)
        {
            return _objDLL.Get_Folder_Details("Get_CurrentUploadFolder", _obj, _objdb);
        }
        public DataTable Load_DocumentStatus(_database _objdb)
        {
            return _objDLL.load_master("LoadDocumentStatus", _objdb);
        }
        public void FileUploadingNew(_clsdocument _obj, _database _objdb)
        {
            _objDLL.FileUploadingNew("FileUploadingNew", _obj, _objdb);
        }
        public DataTable GetDocumentVersion(_clstreefolder _obj, _database _objdb)
        {
            return _objDLL.Get_Folder_Details("GetDocumentVersion", _obj, _objdb);
        }
        public void FileUploading_New(_clsdocument _obj, _database _objdb)
        {
            _objDLL.FileUploading_New("FileUploading_New", _obj, _objdb);

        }
        public DataTable Generate_CAS_RPT_NEW(_clscassheet _obj, _database _objdb)
        {
            return _objDLL.Load_casMain("CASSHEET_RPT_NEW", _obj, _objdb);
        }
        public DataTable Generate_pkg_Summary_2(_clscassheet _obj, _database _objdb)
        {
            return _objDLL.load_cas_panel("GENERATE_PKG_SUMMARY_2_1", _obj, _objdb);
        }
        public DataTable Generate_pkg_Summary_3(_clscassheet _obj, _database _objdb)
        {
            return _objDLL.load_cas_panel("GENERATE_PKG_SUMMARY_3_1", _obj, _objdb);
        }
        public DataTable loadserviceDMS(_clsuser _obj, _database _objdb)
        {
            return _objDLL.load_service("loadserviceDMS", _obj, _objdb);
        }
        public void Update_documentdetails(_clsdocument _obj, _database _objdb)
        {
            _objDLL.Update_documentdetails("Update_documentdetails", _obj, _objdb);
        }
        public DataTable Load_DocumentStyleMaster(_database _objdb)
        {
            return _objDLL.load_master("Load_DocumentStyleMaster", _objdb);
        }
        public DataTable GetDocumentVersion(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.load_document("GetDocumentVersion", _obj, _objdb);
        }
        public DataTable Load_CMLT_Projects(_database _objdb)
        {
            return _objDLL.load_master("LoadCMLT_Projects", _objdb);
        }
        public DataTable Load_Prj_DefaultService(_database _objdb)
        {
            return _objDLL.load_master("LOAD_PRJ_DEFAULT_SERVICE", _objdb);
        }

        public DataTable Load_DMSComments(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.load_comments("Load_DMSComments", _obj, _objdb);
        }
        public DataTable Get_DocumentDetails(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Load_DocDatails("Get_DocumentDetails", _obj, _objdb);
        }
        public int Check_SubFolderDocumentsExists(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Get_CMS_TC_Count("Check_SubfolderDocumentsExists", _obj, _objdb);
        }
        public void Delete_DocumentNew(_clsdocument _obj, _database _objdb)
        {
            _objDLL.Delete_DocumentNew("Delete_DocumentNew", _obj, _objdb);

        }
        public void Move_Tree_Folder_New(_clstreefolder _obj, _database _objdb)
        {
            _objDLL.Move_Tree_Folder("Move_TreeFolderNew", _obj, _objdb);
        }
        public DataTable load_documentNew(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.load_document("loaddocumentsNew", _obj, _objdb);
        }
        
        public string Get_DocumentTitle(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Get_DocumentTitle("Get_DocumentTitle", _obj, _objdb);
        }
        public DataTable Get_FolderDetails(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Load_DMSDoc_AMS("Get_FolderDetails", _obj, _objdb);
        }
        public void dml_schedule_basket(_clsdocument _obj, _database _objdb)
        {
            _objDLL.dml_schedule_basket("DML_SCHEDULE_BASKET", _obj, _objdb);
        }
        public DataTable Load_ScheduleBasket(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Load_ScheduleBasket("LOAD_SCHEDULE_BASKET", _obj, _objdb);
        }
        
        public void CreateDocSchedule(_clsdocument _obj, _database _objdb)
        {
            _objDLL.CreateDocSchedule("CreateSchedule_new", _obj, _objdb);
        }
        public void Create_Schedulebskt(_clsdocument _obj, _database _objdb)
        {
            _objDLL.Create_Schedulebskt("CREATE_SCHEDULE_FROMBSKT", _obj, _objdb);
        }
        public int Check_DocumentStyleExists(_clsdocument _obj, _database _objdb)   
        {
            return _objDLL.Get_CMS_TC_Count("Check_DocumentStyleExists", _obj, _objdb);
        }

        public void Delete_DocumentStyle(_clsdocument _obj, _database _objdb)
        {
            _objDLL.Delete_DocumentStyle("Delete_DocumentStyleMaster_tbl", _obj, _objdb);

        }
        public int Check_Contractor_Exits(_clsmanufacture _obj, _database _objdb)
        {
            return _objDLL.Check_Record_Exits("Check_Contractor_Exits", _obj, _objdb);
        }
        public DataTable Load_Document_Submit(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Load_Document_Submit("Load_Document_Submit", _obj, _objdb);
        }
        public void Update_Document_Submit(_clsdocument _obj, _database _objdb)
        {
            _objDLL.Update_Document_Submit("Update_Document_Submit", _obj, _objdb);
        }
        public DataTable Load_dms_user_email_New(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.load_dms_user_email("Load_dms_User_email_New", _obj, _objdb);
        }
       
        public DataTable Load_AllProgressTracking(_clsProgressTracking _obj, _database _objdb)
        {
            return _objDLL.Load_AllProgressTracking("Load_AllProgressTracking", _obj, _objdb);
        }
        
        public void Update_Document_direct(_clsdocument _obj, _database _objdb)
        {
            _objDLL.Update_Document_direct("Update_Document_direct", _obj, _objdb);
        }
        public void Update_Schedule_direct(_clsdocument _obj, _database _objdb)
        {
            _objDLL.Update_Schedule_direct("Update_Schedule_Direct", _obj, _objdb);
        }
        public DataTable Get_DocumentFileName(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Load_DocDatails("Get_DocumentFileName", _obj, _objdb);
        }
       
        public void Update_CommentStatus(_clsSnag _obj, _database _objdb)
        {
            _objDLL.Update_Doc_Control("Update_CommentStatus", _obj, _objdb);
        }
        public void Update_CmlResponse(_clscomment _obj, _database _objdb)
        {
            _objDLL.add_resp("Update_CmlResponse", _obj, _objdb);
        }
        public DataTable Get_ParentFolders(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Load_DMSDoc_AMS("Get_ParentFolders", _obj, _objdb);
        }
        public void Create_TreeFolderNew(_clstreefolder _obj, _database _objdb)
        {
            _objDLL.Create_TreeFolderNew("Create_TreefolderNew", _obj, _objdb);
        }
        public DataTable Load_DMS_ParentFolders(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Load_DMSDoc_AMS("Load_DMS_ParentFolders", _obj, _objdb);
        }
        public void Delete_Tree_FolderNew(_clsdocument _obj, _database _objdb)
        {
            _objDLL.Create_Schedulebskt("Delete_TreeFoldersNew", _obj, _objdb);
        }
        public DataTable Get_UserProjectPermission(_clsuser _obj, _database _objdb)
        {
            return _objDLL.load_usersrv("Get_UserProjectPermission", _obj, _objdb);
        }
        public void Update_DocumentStatus(_clsdocument _obj, _database _objdb)
        {
            _objDLL.SetDocStatus("Update_DocumentStatus", _obj, _objdb);
        }
        public DataTable load_ProgressTrackingsheet(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Load_DMS_Report_Master("load_ProgressTrackingsheet", _obj, _objdb);
        }
        public void Edit_Tree_FolderNew(_clstreefolder _obj, _database _objdb)
        {
            _objDLL.Edit_Tree_Folder_New("Edit_TreeFolderNew", _obj, _objdb);
        }
        public DataTable Load_ManualQuick_View(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Load_Document_Submit("Load_ManualQuick_View", _obj, _objdb);
        }
        public DataTable load_ManualQuickView_Report(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Load_DMS_Report_Master("load_ManualQuickView_Report", _obj, _objdb);
        }
       
        public void FileUploading_OM(_clsdocument _obj, _database _objdb)
        {
            _objDLL.FileUploading_New("FileUploading_OM", _obj, _objdb);

        }
       
       
        public void Update_ProgressTracking_tbl(_clsProgressTracking _obj, _database _objdb)
        {
            _objDLL.Update_ProgressTracking_tbl("Update_ProgressTracking_tbl", _obj, _objdb);

        }
        
        public void Create_ProgressTreefolder(_clstreefolder _obj, _database _objdb)
        {
            _objDLL.Create_TreeFolderNew("Create_ProgressTreefolder", _obj, _objdb);
        }
        public DataTable load_ProgressTreeFolder_Tbl(_clsuser _obj, _database _objdb)
        {
            return _objDLL.load_service("load_ProgressTreeFolder_Tbl", _obj, _objdb);
        }
     
        public DataTable Get_Progress_DraftIssueDate(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Load_DMSDoc_AMS("Get_Progress_DraftIssueDate", _obj, _objdb);
        }
        public DataTable LoadFolderSchedule(_clstreefolder _obj, _database _objdb)
        {
            return _objDLL.Get_Folder_Details("LoadFolderSchedule", _obj, _objdb);
        }
       
        public DataTable Load_Asset_Register(_database _objdb)
        {
            return _objDLL.load_master("Load_AssetRegister", _objdb);
        }
        
        
        public DataTable Load_dms_library_general(_database _objdb)
        {
            return _objDLL.load_master("Load_dms_library_general", _objdb);
        }
       
        public DataTable Load_DMS_TC_LinkDocument(_clscassheet _obj, _database _objdb)
        {
            return _objDLL.Load_DMS_TCDOC_SYS("Load_DMS_TC_LinkDocument", _obj, _objdb);
        }
        public DataTable Doc_Summary_Report_New(_clsuser _obj, _database _objdb)
        {
            return _objDLL.load_master("Doc_Summary_Report_New", _obj, _objdb);
        }
       
        public DataTable dms_manufacuter_general(_database _objdb)
        {
            return _objDLL.load_master("load_manufacturer_general", _objdb);
        }
      
        public void addcomment_new(_clscomment _obj, _database _objdb)
        {
            _objDLL.addcomment_new("addcomment_New", _obj, _objdb);
        }
        public void Editcomment_new(_clscomment _obj, _database _objdb)
        {
            _objDLL.Editcomment_new("Editcomment_New", _obj, _objdb);
        }

        public DataTable load_CommentDetails(_clscomment _obj, _database _objdb)
        {
            return _objDLL.load_CommentDetails("Load_commentDetails", _obj, _objdb);
        }
        public DataTable Generate_DocumentStatus(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Load_ScheduleList("Generate_DocumentStatus", _obj, _objdb);
        }
        public DataTable Load_dms_report_master_New(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Load_DMS_Report_Master("Load_dms_report_master_New", _obj, _objdb);
        }
        public void dml_amslocation(_clsams _obj, _database _objdb)
        {
            _objDLL.dml_amslocation("dml_location", _obj, _objdb);
        }
        public void dml_amsroom(_clsams _obj, _database _objdb)
        {
            _objDLL.dml_amsroom("dml_room", _obj, _objdb);
        }
        public DataTable Load_amslocation(_database _objdb)
        {
            return _objDLL.load_master("load_amslocation",_objdb);
        }
        public DataTable Load_amsroom(_database _objdb)
        {
            return _objDLL.load_master("load_amsroom", _objdb);
        }
        
        public DataTable Get_DMS_LIBRARY_GENERAL_Details(_clscassheet _obj, _database _objdb)
        {
            return _objDLL.Load_System_List("Get_DMS_LIBRARY_GENERAL_Details", _obj, _objdb);
        }
        public void Insert_Manufaturer_tbl_General(_clsmanufacture _obj, _database _objdb)
        {
            _objDLL.Create_Manufacture("Insert_MANUFACTURER_TBL_GENERAL", _obj, _objdb);
        }
       
       
        public void AddToProject_Library(_clsdocument _obj, _database _objdb)
        {
            _objDLL.AddToProject_Library("AddToProject_Library", _obj, _objdb);
        }
        public DataTable loadserviceDMS_Graph(_clsuser _obj, _database _objdb)
        {
            return _objDLL.load_service("loadserviceDMS_Graph", _obj, _objdb);
        }
        public DataTable Load_Document_Library_Project(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Load_Document_Library_Project("Load_dms_library_project", _obj, _objdb);
        }
        public DataTable Generate_DocumentStatus_Other(_clscmsdocument _obj, _database _objdb)
        {
            return _objDLL.Generate_DocumentStatus_Other("Generate_DocumentStatus_Other", _obj, _objdb);
        }
        public DataTable UploadSummaryServiceList(_clsuser _obj, _database _objdb)
        {
            return _objDLL.load_service("UploadSummaryServiceList", _obj, _objdb);
        }
        public void Delete_Comment_Response(_clscomment _obj, _database _objdb)
        {
            _objDLL.Deletecomment("Delete_Comment_Response", _obj, _objdb);
        }
        
        public void Move_Folder_New(_clsdocument _obj, _database _objdb)
        {
            _objDLL.Move_Folder("Manage_Folder_New", _obj, _objdb);
        }
        public DataTable LoadSchedule_List_New(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Load_ScheduleList("LoadSchedule_List_New", _obj, _objdb);
        }
        public int Get_Document_Library_Count(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Get_Document_Library_Count("Check_Document_Library_Exits", _obj, _objdb);
        }

        public DataTable Get_folderProjectdescription(_clstreefolder _obj, _database _objdb)
        {
            return _objDLL.Get_Folder_Details("Get_folderProjectdescription1", _obj, _objdb);
        }
       
        public DataTable load_AllDocumentsDirectFolder_TD(_clstreefolder _obj, _database _objdb)
        {
            return _objDLL.Get_Folder_Details("load_AllDocumentsDirectFolder_TD", _obj, _objdb);
        }
        public DataTable LoadAllDocuments_Service(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Load_ScheduleList("LoadAllDocuments_Service", _obj, _objdb);
        }
        public void Manage_Document_Position(_clsdocument _obj, _database _objdb)
        {
            _objDLL.Move_Folder("Manage_Document_Position", _obj, _objdb);
        }
        public DataTable load_FolderDocuments(_clstreefolder _obj, _database _objdb)
        {
            return _objDLL.Get_Folder_Details("load_FolderDocuments", _obj, _objdb);
        }
        public void dml_dms_library_general_new(_clsdocument _obj, _database _objdb)
        {
            _objDLL.dml_dms_library_general_new("dml_dms_library_general_new", _obj, _objdb);
        }
       
        public DataTable Load_Buildinglevel_Navigation(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Load_Buildinglevel_Navigation("Load_BuildingLevel_Navigation", _obj, _objdb);
        }
      
        public int Get_ServiceFolderType(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Get_Package_Service("Get_ServiceFolderType", _obj, _objdb);
        }
       
        public DataTable Get_DafaultNavFolder1(_clstreefolder _obj, _database _objdb)
        {
            return _objDLL.Get_Folder_Details("Get_DafaultNavFolder_4", _obj, _objdb);
        }
        public DataTable Load_AllProgressTracking1(_clsProgressTracking _obj, _database _objdb)
        {
            return _objDLL.Load_AllProgressTracking("Load_AllProgressTracking1", _obj, _objdb);
        }
        public void Update_ProgressTracking_tbl1(_clsProgressTracking _obj, _database _objdb)
        {
            _objDLL.Update_ProgressTracking_tbl("Update_ProgressTracking_tbl1", _obj, _objdb);

        }
      
        public DataTable Get_Project_Logo(_clsuser _obj, _database _objdb)
        {
            return _objDLL.load_master("Get_Project_Logo", _obj, _objdb);
        }
        public DataTable load_ProgressTrackingsheet1(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Load_DMS_Report_Master("load_ProgressTrackingsheet1", _obj, _objdb);
        }
      
        public void Delete_DMS_Document_New(_clsdocument _obj, _database _objdb)
        {
            _objDLL.Delete_DMS_Document_New("Delete_DMS_Document_New", _obj, _objdb);
        }
       
        public DataTable Get_MaxSeqNo(_database _objdb)
        {
            return _objDLL.load_master("Get_MaxLibraryId", _objdb);
        }
        public DataTable Get_LibraryFileName(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.Load_DocDatails("Get_LibraryFileName", _obj, _objdb);
        }
        public int Check_Manufacture_Exits(_clsmanufacture _obj, _database _objdb)
        {
            return _objDLL.Check_Record_Exits("Check_Manufacture_Exits", _obj, _objdb);
        }

        public int ValidateDocumentRevision(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.ValidateDocumentRevision("ValidateDocumentRevision", _obj, _objdb);
        }

        public DataTable load_dms_doc_upload(_clsdocument _obj, _database _objdb)
        {
            return _objDLL.load_dms_doc_upload("Load_dmsdoc_upload", _obj, _objdb);
        }
        public DataTable load_DocumentStatus(_clsuser _obj, _database _objdb)
        {
            return _objDLL.load_master("Load_DocumentStatus", _obj, _objdb);
        }
    }
}
