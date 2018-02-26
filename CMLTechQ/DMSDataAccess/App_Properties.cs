using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace App_Properties
{
    public class _clsuser
    {
        string _uid;
        string _pwd;
        string _project_code;
        public string uid
        {
            get { return _uid; }
            set { _uid = value; }
        }
        public string pwd
        {
            get { return _pwd; }
            set { _pwd = value; }
        }       
        public string project_code
        {
            get { return _project_code; }
            set { _project_code = value; }
        }
    }
    public class _clsdocument
    {
        int _service_code;
        int _package_code;
        int _doctype_code;
        string _doc_title;
        string _doc_name;
        Boolean _uploaded;
        DateTime _uploaded_date;
        string _file_size;
        int _schid;
        int _folder_id;
        string _project_code;
        string _move;
        int _doc_id;
        int _possition;
        string _status;
        string _type;
        bool _enabled;
        string _uid;
        public int service_code
        {
            get { return _service_code; }
            set { _service_code = value; }
        }
        public int package_code
        {
            get { return _package_code; }
            set { _package_code = value; }
        }
        public int doctype_code
        {
            get { return _doctype_code; }
            set { _doctype_code = value; }
        }
        public string doc_title
        {
            get { return _doc_title; }
            set { _doc_title = value; }
        }
        public string doc_name
        {
            get { return _doc_name; }
            set { _doc_name = value; }
        }
        public Boolean uploaded
        {
            get { return _uploaded; }
            set { _uploaded = value; }
        }
        public DateTime uploaded_date
        {
            get { return _uploaded_date; }
            set { _uploaded_date = value; }
        }
        public string file_size
        {
            get { return _file_size; }
            set { _file_size = value; }
        }
        public int schid
        {
            get { return _schid; }
            set { _schid = value; }
        }
        public int folder_id
        {
            get { return _folder_id; }
            set { _folder_id = value; }
        }
        public string project_code
        {
            get { return _project_code; }
            set { _project_code = value; }
        }
        public string move
        {
            get { return _move; }
            set { _move = value; }
        }
        public int doc_id
        {
            get { return _doc_id; }
            set { _doc_id = value; }
        }
        public int possition
        {
            get { return _possition; }
            set { _possition = value; }
        }
        public string status
        {
            get { return _status; }
            set { _status = value; }
        }
        public string type
        {
            get { return _type ; }
            set { _type  = value; }
        }
        public bool enabled
        {
            get { return _enabled; }
            set { _enabled = value; }
                
        }
        public string uid
        {
            get { return _uid; }
            set { _uid = value; }
        }       
        string _version;
        public string Version
        {
            get { return _version; }
            set { _version = value; }
        }
        string _Mtitle;
        public string Manual_title
        {
            get { return _Mtitle; }
            set { _Mtitle = value; }
        }
        bool _review;
        string _displayVersion;
        int _docStyleId;
        bool _docStyleChange;

        public bool Review
        {
            get { return _review; }
            set { _review = value; }
        }
        
        public string DisplayVersion
        {
            get { return _displayVersion; }
            set { _displayVersion = value; }
        }


        public int DocStyleId
        {
            get { return _docStyleId; }
            set { _docStyleId = value; }
        }


        public bool DocStyleChange
        {
            get { return _docStyleChange; }
            set { _docStyleChange = value; }
        }
        int _party_id;
        public int party_id
        {
            get { return _party_id; }
            set { _party_id = value; }
        }
        int _action;
        public int action
        {
            get { return _action; }
            set { _action = value; }
        }
        string _party_name;
        public string party_name
        {
            get { return _party_name; }
            set { _party_name = value; }
        }
        bool _submit;
        public bool submit
        {
            get { return _submit; }
            set { _submit = value; }
        }
        string _reff;
        public string reff
        {
            get { return _reff; }
            set { _reff = value; }
        }
        string _title;
        public string title
        {
            get { return _title; }
            set { _title = value; }
        }
    }
  
    public class _clscomment
    {
        int _comm_id;
        string _sec_no;
        string _page_no;
        string _comment;
        DateTime _com_date;
        string _user_id;
        string _resp;
        int _doc_id;
        string _prj_code;
        string _module;
        int _type;
        public int comm_id
        {
            get { return _comm_id; }
            set { _comm_id = value; }
        }
        public string sec_no
        {
            get { return _sec_no; }
            set { _sec_no = value; }
        }
        public string page_no
        {
            get { return _page_no; }
            set { _page_no = value; }
        }
        public string comment
        {
            get { return _comment; }
            set { _comment = value; }
        }
        public DateTime com_date
        {
            get { return _com_date; }
            set { _com_date = value; }
        }
        public string user_id
        {
            get { return _user_id; }
            set { _user_id = value; }
        }
        public string resp
        {
            get { return _resp; }
            set { _resp = value; }
        }
        public int doc_id
        {
            get { return _doc_id; }
            set { _doc_id = value; }
        }
        public string prj_code
        {
            get { return _prj_code; }
            set { _prj_code = value; }
        }
        public string module
        {
            get { return _module; }
            set { _module = value; }
        }
        public int type
        {
            get { return _type; }
            set { _type = value; }
        }
        string image_name;

        public string Image_name
        {
            get { return image_name; }
            set { image_name = value; }
        }
    }
    public class _clsproject
    {        
        string _user;        
        public string user
        {
            get { return _user; }
            set { _user = value; }
        }
        string _module;
        public string module
        {
            get { return _module; }
            set { _module = value; }
        }
        int _prj_id;
        public int prj_id
        {
            get { return _prj_id; }
            set { _prj_id = value; }
        }
    }   
    public class _clstreefolder
    {
        string _Folder_code;
        string _Folder_description;
        int _Folder_type;
        int _Folder_possition;
        string _Parent_folder;
        string _Project_code;
        bool _Enabled;
        int _Folder_id;
        string _mode;
        int _auto;
        string _userid;

        public string Userid
        {
            get { return _userid; }
            set { _userid = value; }
        }
        public string Folder_code
        {
            get { return _Folder_code; }
            set { _Folder_code = value; }
        }
        public string Folder_description
        {
            get { return _Folder_description; }
            set { _Folder_description = value; }
        }
        public int Folder_type
        {
            get { return _Folder_type; }
            set { _Folder_type = value; }
        }
        public int Folder_possition
        {
            get { return _Folder_possition; }
            set { _Folder_possition = value; }
        }
        public string Parent_folder
        {
            get { return _Parent_folder; }
            set { _Parent_folder = value; }
        }
        public string Project_code
        {
            get { return _Project_code; }
            set { _Project_code = value; }
        }
        public bool Enabled
        {
            get { return _Enabled; }
            set { _Enabled = value; }
        }
        public int Folder_id
        {
            get { return _Folder_id; }
            set { _Folder_id = value; }
        }
        public string mode
        {
            get { return _mode; }
            set { _mode = value; }
        }
        public int auto
        {
            get { return _auto; }
            set { _auto = value; }
        }
      
    }
    public class _clsmanufacture
    {
        string _man_name;
        string _project_code;
        public string man_name
        {
            get { return _man_name; }
            set { _man_name = value; }
        }
        public string project_code
        {
            get{return _project_code;}
            set{_project_code=value;}
        }
    }
    public class _clsdocduration
    {
        int _Folder_id;
        int _Duration;
        int _First;
        int _Second;
        int _Third;
        int _Remind;
        string _prj_code;
        public int Folder_id
        {
            get { return _Folder_id; }
            set { _Folder_id = value; }
        }
        public int Duration
        {
            get { return _Duration; }
            set { _Duration = value; }
        }
        public int First
        {
            get { return _First; }
            set { _First = value; }
        }
        public int Second
        {
            get { return _Second; }
            set { _Second = value; }
        }
        public int Third
        {
            get { return _Third; }
            set { _Third = value; }
        }
        public int Remind
        {
            get { return _Remind; }
            set { _Remind = value; }
        }
        public string prj_code
        {
            get { return _prj_code; }
            set { _prj_code = value; }
        }

    }
    public class _clscassheet
    {
       
       
        
        
                  
       
        int _mode;
        
        
       
       
       
       

        string _cate;
        public string cate
        {
            get { return _cate; }
            set { _cate = value; }
        }
        string _b_zone;
        public string b_zone
        {
            get { return _b_zone; }
            set { _b_zone = value; }
        }
        string _f_level;
        public string f_level
        {
            get { return _f_level; }
            set { _f_level = value; }
        }
        int _seq_no;
        public int seq_no
        {
            get { return _seq_no; }
            set { _seq_no = value; }
        }
        int _c_s_id;
        public int c_s_id
        {
            get { return _c_s_id; }
            set { _c_s_id = value; }
        }
        int _sch;
        public int sch
        {
            get { return _sch; }
            set { _sch = value; }
        }
        int _sys;
        public int sys
        {
            get { return _sys; }
            set { _sys = value; }
        }
        string _reff;
        string _desc;
        string _loca;
        string _fed_from;
        public string reff
        {
            get { return _reff; }
            set { _reff = value; }
        }
        public string desc
        {
            get { return _desc; }
            set { _desc = value; }
        }
        public string loca
        {
            get { return _loca; }
            set { _loca = value; }
        }
        public string fed_from
        {
            get { return _fed_from; }
            set { _fed_from = value; }
        }
        string _uid;
        int _srv; 
        public string uid
        {
            get { return _uid; }
            set { _uid = value; }
        }     
        public int srv
        {
            get { return _srv; }
            set { _srv = value; }
        }
        string _prj_code;
        string _p_power_to;
        public string prj_code
        {
            get { return _prj_code; }
            set { _prj_code = value; }
        }
       
        public string p_power_to
        {
            get { return _p_power_to; }
            set { _p_power_to = value; }
        }
        int _cas_id;
        public int cas_id
        {
            get { return _cas_id; }
            set { _cas_id = value; }
        }
        public int mode
        {
            get { return _mode; }
            set { _mode = value; }
        }
        string _sub_st;
        string _s_c_m;
        string _dev1;
        string _dev2;
        string _dev3;
        int _Position;
        public string sub_st
        {
            get { return _sub_st; }
            set { _sub_st = value; }
        }
        public string s_c_m
        {
            get { return _s_c_m; }
            set { _s_c_m = value; }                
        }
        public string dev1
        {
            get { return _dev1; }
            set { _dev1 = value; }
        }
        public string dev2
        {
            get { return _dev2; }
            set { _dev2 = value; }
        }
        public string dev3
        {
            get { return _dev3; }
            set { _dev3 = value; }
        }    
        public int Position
        {
            get { return _Position; }
            set { _Position = value; }
        }
        int _panel_id;
        public int panel_id
        {
            get { return _panel_id; }
            set { _panel_id = value; }
        }       
        
    }    
    public class _clscmsdocument
    {   string _project_code;        
        
        
        public string project_code
        {
            get { return _project_code; }
            set { _project_code = value; }
        }
        int _srv_id;
        public int srv_id
        {
            get { return _srv_id; }
            set { _srv_id = value; }
        }
        string _Type;
        public string Type
        {
            get { return _Type; }
            set { _Type = value; }
        }
    }  
    public class _database
    {
        string _DBName; 
        public string DBName
        {
            get { return _DBName; }
            set { _DBName = value; }
        }       
    }   
    public class _clsFolderTree
    {    
        int _Parent_folder; 
        public int Parent_folder
        {
            get { return _Parent_folder; }
            set { _Parent_folder = value; }
        }
    }    
    public class _clsSnag
    {        
        int _pkg_id;
        string _userid;       
       
        public int pkg_id
        {
            get { return _pkg_id; }
            set { _pkg_id = value; }
        }
        public string userid
        {
            get { return _userid; }
            set { _userid = value; }
        }
    }
    public class _clsams
    {
        int _manufId;
        public int manufId
        {
            get { return _manufId; }
            set { _manufId = value; }
        }
        int _action;
        public int action
        {
            get { return _action; }
            set { _action = value; }
        }
        string _manufName;
        public string manufName
        {
            get { return _manufName; }
            set { _manufName = value; }
        }       
        int _casId;
        public int casId
        {
            get { return _casId; }
            set { _casId = value; }
        }
        int _sys_id;
        public int sys_id
        {
            get { return _sys_id; }
            set { _sys_id = value; }
        }  
        int _ams_reg_id;
        public int ams_reg_id
        {
            get { return _ams_reg_id; }
            set { _ams_reg_id = value; }
        }
        int _sch_id;
        public int sch_id
        {
            get { return _sch_id; }
            set { _sch_id = value; }
        }
        string _prj_reff;
        public string prj_reff
        {
            get { return _prj_reff; }
            set { _prj_reff = value; }
        }
        string _bzone;
        public string bzone
        {
            get { return _bzone; }
            set { _bzone = value; }
        }
        string _cat;
        public string cat
        {
            get { return _cat; }
            set { _cat = value; }
        }
        string _flvl;
        public string flvl
        {
            get { return _flvl; }
            set { _flvl = value; }
        }
        string _seq_no;
        public string seq_no
        {
            get { return _seq_no; }
            set { _seq_no = value; }
        }
        bool _parent;
        public bool parent
        {
            get { return _parent; }
            set { _parent = value; }
        }
        int _position;
        public int position
        {
            get { return _position; }
            set { _position = value; }
        }
        string _location;
        public string location
        {
            get { return _location; }
            set { _location = value; }
        }
        int _parent_id;
        public int parent_id
        {
            get { return _parent_id; }
            set { _parent_id = value; }
        }
        int _id;
        public int id
        {
            get { return _id; }
            set { _id = value; }
        }
    }    
    public class _clsProgressTracking
    {
        int _progress_id;

        public int Progress_id
        {
            get { return _progress_id; }
            set { _progress_id = value; }
        }
        int _folder_id;

        public int Folder_id
        {
            get { return _folder_id; }
            set { _folder_id = value; }
        }
        string _userid;

        public string Userid
        {
            get { return _userid; }
            set { _userid = value; }
        }
        string _value;

        public string Value
        {
            get { return _value; }
            set { _value = value; }
        }
        int _type;
        public int Type
        {
            get { return _type; }
            set { _type = value; }
        }
    }
    public class _clslog
    {
        string _uid;
        string _ipaddr;
        string _location;
        string _login;
        string _module;
        bool _status;
        public string uid
        {
            get { return _uid; }
            set { _uid = value; }
        }
        public string ipaddr
        {
            get { return _ipaddr; }
            set { _ipaddr = value; }
        }
        public string location
        {
            get { return _location; }
            set { _location = value; }
        }
        public string module
        {
            get { return _module; }
            set { _module = value; }
        }
        public string login
        {
            get { return _login; }
            set { _login = value; }
        }
        
        public bool status
        {
            get { return _status; }
            set { _status = value; }
        }
        string _country;
        public string Country
        {
            get { return _country; }
            set { _country = value; }
        }
        string _region;

        public string Region
        {
            get { return _region; }
            set { _region = value; }
        }

    }
  
}
