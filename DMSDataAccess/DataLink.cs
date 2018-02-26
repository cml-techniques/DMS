using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using App_Properties;

namespace DataLinkLibrary
{
    public class SQL_Connection
    {
        SqlConnection Sqlcon;

        public SqlConnection con_open(string DB)
        {
            _database _objdb = new _database();
            //Sqlcon = new SqlConnection("Data Source=.;Initial Catalog=dbcmlmaster;Integrated Security=True");
            //if (_objdb.DBName == "")
            //    _objdb.DBName = "DBCML";
            //string _query = "server=173.83.250.253;uid=sa;pwd=vCr6wgu3;database=" + DB + ";Connection Timeout=120;Pooling=true;Min Pool Size=0;Max Pool Size=500;";
            //string _query = "server=37.61.235.103;uid=sa;pwd=vCr6wgu3;database=" + DB + ";Connection Timeout=120;Pooling=true;Min Pool Size=0;Max Pool Size=500;";
            //string _query = "server=37.61.235.103;uid=CML#server2012;pwd=$Cml#Ca20Jo1Su5;database=" + DB + ";Connection Timeout=120;Pooling=true;Min Pool Size=0;Max Pool Size=500;";
            string _query = "server=213.171.197.149,49296;uid=cmlt;pwd=C!m@l#S$q%l;database=" + DB + ";Connection Timeout=120;Pooling=true;Min Pool Size=0;Max Pool Size=500;";

            //string _query = "server=CMLTQ-SERVER;uid=sa;pwd=cmltq#server;database=" + DB + ";Connection Timeout=120;Pooling=true;Min Pool Size=0;Max Pool Size=500;";
            //Sqlcon = new SqlConnection("server=173.83.250.253;uid=sa;pwd=vCr6wgu3;database=dbCML;Connection Timeout=60;Pooling=true;Min Pool Size=0;Max Pool Size=500;");

            Sqlcon = new SqlConnection(_query);
            try
            {
                //if (Sqlcon.State == ConnectionState.Open)
                //    Sqlcon.Close();
                Sqlcon.Open();
                return Sqlcon;
            }
            catch (Exception ex)
            {
                Console.Write(ex.ToString());
            }
            return Sqlcon;
        }
       
    }
    public class DLL_Dml
    {
        SqlCommand _cmd;
        SqlDataAdapter _dta;
        SQL_Connection _objcon = new SQL_Connection();
        
        public bool _validUser(string _sp, _clsuser _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@uid", _obj.uid);
            _cmd.Parameters.AddWithValue("@pwd", _obj.pwd);
            _cmd.Parameters.Add("@validuser", SqlDbType.VarChar, 50);
            _cmd.Parameters["@validuser"].Direction = ParameterDirection.Output;
            try
            {
                _cmd.ExecuteNonQuery();
                if (_cmd.Parameters["@validuser"].Value.ToString() != "")
                    return true;
                else
                    return false;
            }
            catch
            {
                throw;
            }
        }

        public void UpdateUserLog(string _sp, _clslog _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@_uid", _obj.uid);
            _cmd.Parameters.AddWithValue("@_ipaddress", _obj.ipaddr);
            _cmd.Parameters.AddWithValue("@_country", _obj.Country);
            _cmd.Parameters.AddWithValue("@_region", _obj.Region);
            _cmd.Parameters.AddWithValue("@_location", _obj.location);
            _cmd.Parameters.AddWithValue("@_module", _obj.module);
            _cmd.Parameters.AddWithValue("@_login", _obj.login);
            _cmd.ExecuteNonQuery();
        }
        public string GetAutoPassword(string _sp, _clsuser _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@uid", _obj.uid);
            _cmd.Parameters.Add("@pwd", SqlDbType.VarChar, 15);
            _cmd.Parameters["@pwd"].Direction = ParameterDirection.Output;
            try
            {
                _cmd.ExecuteNonQuery();
                if (_cmd.Parameters["@pwd"].Value.ToString() != "")
                    return _cmd.Parameters["@pwd"].Value.ToString();
                else
                    return "0";
            }
            catch
            {
                throw;
            }
        }
        
        public DataTable load_master(string _sp, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
        public DataTable load_document(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@folder_id", _obj.folder_id);
            _cmd.Parameters.AddWithValue("@Enabled", _obj.enabled);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
        public void addcomment(string _sp, _clscomment _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@sec_no", _obj.sec_no);
            _cmd.Parameters.AddWithValue("@page_no", _obj.page_no);
            _cmd.Parameters.AddWithValue("@comment", _obj.comment);
            _cmd.Parameters.AddWithValue("@com_date", _obj.com_date);
            _cmd.Parameters.AddWithValue("@user_id", _obj.user_id);
            _cmd.Parameters.AddWithValue("@doc_id", _obj.doc_id);
            _cmd.ExecuteNonQuery();
        }
        
        public void Deletecomment(string _sp, _clscomment _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@comm_id", _obj.comm_id);
            _cmd.ExecuteNonQuery();
        }
       
        public DataTable load_comments(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@doc_id", _obj.doc_id);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
        public DataTable load_usercomments(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@doc_id", _obj.doc_id);
            _cmd.Parameters.AddWithValue("@userid", _obj.uid);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
        public void file_upload(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@service", _obj.service_code);
            _cmd.Parameters.AddWithValue("@package", _obj.package_code);
            _cmd.Parameters.AddWithValue("@doctype", _obj.doctype_code);
            _cmd.Parameters.AddWithValue("@doc_title", _obj.doc_title);
            _cmd.Parameters.AddWithValue("@doc_name", _obj.doc_name);
            _cmd.Parameters.AddWithValue("@uploaded", _obj.uploaded);
            _cmd.Parameters.AddWithValue("@uploaded_date", _obj.uploaded_date);
            _cmd.Parameters.AddWithValue("@file_size", _obj.file_size);
            _cmd.Parameters.AddWithValue("@schid", _obj.schid);
            _cmd.Parameters.AddWithValue("@folder_id", _obj.folder_id);
            _cmd.Parameters.AddWithValue("@type", _obj.type);
            _cmd.Parameters.AddWithValue("@uid", _obj.uid);
            _cmd.Parameters.AddWithValue("@possition", _obj.possition);
            _cmd.ExecuteNonQuery();


        }
       
        public void Create_Schedule(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@service", _obj.service_code);
            _cmd.Parameters.AddWithValue("@package", _obj.package_code);
            _cmd.Parameters.AddWithValue("@doctype", _obj.doctype_code);
            _cmd.Parameters.AddWithValue("@doc_title", _obj.doc_title);
            _cmd.Parameters.AddWithValue("@doc_name", _obj.doc_name);
            _cmd.Parameters.AddWithValue("@date_tobeuploaded", _obj.uploaded_date);
            _cmd.Parameters.AddWithValue("@Folder_id", _obj.folder_id);
            _cmd.Parameters.AddWithValue("@Project_code", _obj.project_code);
            _cmd.Parameters.AddWithValue("@uid", _obj.uid);
            _cmd.Parameters.AddWithValue("@possition", _obj.possition);
            _cmd.ExecuteNonQuery();
        }
       
        public void Move_Tree_Folder(string _sp, _clstreefolder _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@Folder_id", _obj.Folder_id);
            _cmd.Parameters.AddWithValue("@Folder_possition", _obj.Folder_possition);
            _cmd.ExecuteNonQuery();
        }
        public void Create_Manufacture(string _sp, _clsmanufacture _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@Manufacture_name", _obj.man_name);
            _cmd.Parameters.AddWithValue("@Project_code", _obj.project_code);
            _cmd.ExecuteNonQuery();
        }
        public void Create_Contractor(string _sp, _clsmanufacture _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@con_name", _obj.man_name);
            _cmd.Parameters.AddWithValue("@prj_code", _obj.project_code);
            _cmd.ExecuteNonQuery();
        }
        public DataTable load_master(string _sp, _clsuser _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@Project_code", _obj.project_code);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
      
        public DataTable load_service(string _sp, _clsuser _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@Project_code", _obj.project_code);
            _cmd.Parameters.AddWithValue("@userid", _obj.uid);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
        public void Move_document(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@doc_id", _obj.doc_id);
            _cmd.Parameters.AddWithValue("@folder_id", _obj.folder_id);
            _cmd.Parameters.AddWithValue("@possition", _obj.possition);
            _cmd.Parameters.AddWithValue("@move", _obj.move);
            _cmd.ExecuteNonQuery();
        }
        
        public void SetDocDuration(string _sp, _clsdocduration _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@Folder_id", _obj.Folder_id);
            _cmd.Parameters.AddWithValue("@Duration", _obj.Duration);
            _cmd.Parameters.AddWithValue("@First", _obj.First);
            _cmd.Parameters.AddWithValue("@Second", _obj.Second);
            _cmd.Parameters.AddWithValue("@Third", _obj.Third);
            _cmd.Parameters.AddWithValue("@prj_code", _obj.prj_code);
            _cmd.ExecuteNonQuery();
        }
        public DataTable LoadDocDatails(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@doc_id", _obj.doc_id);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
        public DataTable Load_DocDatails(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@DOC_ID", _obj.doc_id);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
        public void SetDocStatus(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@doc_id", _obj.doc_id);
            _cmd.Parameters.AddWithValue("@status", _obj.status);
            _cmd.ExecuteNonQuery();
        }
        
        public DataTable load_usersrv(string _sp, _clsuser _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@userid", _obj.uid);
            _cmd.Parameters.AddWithValue("@project_code", _obj.project_code);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
       
        public void Delete_Doc(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@doc_id", _obj.doc_id);
            _cmd.ExecuteNonQuery();
        }
       
        public int ValidateDocumentRevision(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@folder_id", _obj.folder_id);
            _cmd.Parameters.AddWithValue("@DisplayVersion", _obj.DisplayVersion);
            _cmd.Parameters.Add("@exists", SqlDbType.Int);
            _cmd.Parameters["@exists"].Direction = ParameterDirection.Output;
            try
            {
                _cmd.ExecuteNonQuery();
                if (_cmd.Parameters["@exists"].Value.ToString() != "")
                    return System.Convert.ToInt32(_cmd.Parameters["@exists"].Value.ToString());
                else
                    return 0;
            }
            catch
            {
                throw;
            }
        }
        public void add_resp(string _sp, _clscomment _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@comm_id", _obj.comm_id);
            _cmd.Parameters.AddWithValue("@resp", _obj.resp);
            _cmd.ExecuteNonQuery();
        }
        public DataTable Load_cas_sys(string _sp, _clscassheet _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@sch", _obj.sch);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
      
        public DataTable Load_casMain(string _sp, _clscassheet _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@sch_id", _obj.sch);
            _cmd.Parameters.AddWithValue("@prj_code", _obj.prj_code);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
        public DataTable Load_casMain_Edit(string _sp, _clscassheet _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@sch_id", _obj.sch);
            _cmd.Parameters.AddWithValue("@prj_code", _obj.prj_code);
            _cmd.Parameters.AddWithValue("@sys_id", _obj.sys);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
       
        public string ChkUserLoggedIN(string _sp, _clsuser _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@uid", _obj.uid);
            _cmd.Parameters.Add("@ip", SqlDbType.VarChar, 50);
            _cmd.Parameters["@ip"].Direction = ParameterDirection.Output;
            _cmd.Parameters.Add("@login", SqlDbType.VarChar, 50);
            _cmd.Parameters["@login"].Direction = ParameterDirection.Output;
            try
            {
                _cmd.ExecuteNonQuery();
                if (_cmd.Parameters["@ip"].Value.ToString() != "")
                    return _cmd.Parameters["@ip"].Value.ToString() + "_L" + _cmd.Parameters["@login"].Value.ToString();
                else
                    return "NotExist";
            }
            catch
            {
                throw;
            }
        }
      
        public void Remove_basket(string _sp, _clscomment _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@id", _obj.comm_id);
            _cmd.ExecuteNonQuery();
        }
      
        public DataTable load_comment_basket(string _sp, _clscomment _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@uid", _obj.user_id);
            _cmd.Parameters.AddWithValue("@prj_code", _obj.prj_code);
            _cmd.Parameters.AddWithValue("@module", _obj.module);
            _cmd.Parameters.AddWithValue("@type", _obj.type);
            _cmd.Parameters.AddWithValue("@doc_id", _obj.doc_id);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
        public void Cassheet_Master(string _sp, _clscassheet _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@c_s_id", _obj.c_s_id);
            _cmd.Parameters.AddWithValue("@p_code", _obj.prj_code);
            _cmd.Parameters.AddWithValue("@uid", _obj.uid);
            _cmd.Parameters.AddWithValue("@sys_id", _obj.sys);
            _cmd.Parameters.AddWithValue("@e_b_ref", _obj.reff);
            _cmd.Parameters.AddWithValue("@b_z", _obj.b_zone);
            _cmd.Parameters.AddWithValue("@cat", _obj.cate);
            _cmd.Parameters.AddWithValue("@f_lvl", _obj.f_level);
            _cmd.Parameters.AddWithValue("@sq_no", _obj.seq_no);
            _cmd.Parameters.AddWithValue("@des", _obj.desc);
            _cmd.Parameters.AddWithValue("@loc", _obj.loca);
            _cmd.Parameters.AddWithValue("@p_p_to", _obj.p_power_to);
            _cmd.Parameters.AddWithValue("@f_from", _obj.fed_from);
            _cmd.Parameters.AddWithValue("@sub_st", _obj.sub_st);
            _cmd.Parameters.AddWithValue("@s_c_m", _obj.s_c_m);
            _cmd.Parameters.AddWithValue("@dev1", _obj.dev1);
            _cmd.Parameters.AddWithValue("@dev2", _obj.dev2);
            _cmd.Parameters.AddWithValue("@dev3", _obj.dev3);
            _cmd.Parameters.AddWithValue("@mode", _obj.mode);
            _cmd.Parameters.AddWithValue("@cas_id", _obj.cas_id);
            _cmd.Parameters.AddWithValue("@Position", _obj.Position);
            _cmd.Parameters.AddWithValue("@Panel_id", _obj.panel_id);
            _cmd.ExecuteNonQuery();
        }
       
        public DataTable Load_SubFolder(string _sp, _clsFolderTree _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@parent", _obj.Parent_folder);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
       
        public void Update_Doc_Control(string _sp, _clsSnag _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@Prj_com_id", _obj.pkg_id);
            _cmd.Parameters.AddWithValue("@userid", _obj.userid);
            _cmd.ExecuteNonQuery();
        }
       
        public void Delete_Schedule(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@Sch_Id", _obj.schid);
            _cmd.ExecuteNonQuery();
        }
        public int Get_Seq(string _sp, _clscassheet _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@Sys_Id", _obj.sys);
            _cmd.Parameters.AddWithValue("@F_lvl", _obj.f_level);
            _cmd.Parameters.AddWithValue("@B_Z", _obj.b_zone);
            _cmd.Parameters.AddWithValue("@Pos", _obj.Position);
            _cmd.Parameters.Add("@Seq_No", SqlDbType.Int);
            _cmd.Parameters["@Seq_No"].Direction = ParameterDirection.Output;
            try
            {
                _cmd.ExecuteNonQuery();
                if (_cmd.Parameters["@Seq_No"].Value.ToString() != "")
                    return (int)_cmd.Parameters["@Seq_No"].Value;
                else
                    return 1;
            }
            catch
            {
                throw;
            }
        }
        public int Get_Position(string _sp, _clscassheet _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@Sys_Id", _obj.sys);
            _cmd.Parameters.Add("@Position", SqlDbType.Int);
            _cmd.Parameters["@Position"].Direction = ParameterDirection.Output;
            try
            {
                _cmd.ExecuteNonQuery();
                if (_cmd.Parameters["@Position"].Value.ToString() != "")
                    return (int)_cmd.Parameters["@Position"].Value;
                else
                    return 1;
            }
            catch
            {
                throw;
            }
        }

        public int Check_EngRef(string _sp, _clscassheet _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@E_b_Ref", _obj.reff);
            _cmd.Parameters.AddWithValue("@sch_id", _obj.sch);
            _cmd.Parameters.Add("@Exist", SqlDbType.Int);
            _cmd.Parameters["@Exist"].Direction = ParameterDirection.Output;
            try
            {
                _cmd.ExecuteNonQuery();
                if (_cmd.Parameters["@Exist"].Value.ToString() != "")
                    return (int)_cmd.Parameters["@Exist"].Value;
                else
                    return 0;
            }
            catch
            {
                throw;
            }
        }
       
        public int Get_SysId(string _sp, _clscassheet _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@Category", _obj.cate);
            _cmd.Parameters.AddWithValue("@Sch_Id", _obj.sch);
            _cmd.Parameters.Add("@Sys_Id", SqlDbType.Int);
            _cmd.Parameters["@Sys_Id"].Direction = ParameterDirection.Output;
            try
            {
                _cmd.ExecuteNonQuery();
                if (_cmd.Parameters["@Sys_Id"].Value.ToString() != "")
                    return Convert.ToInt32(_cmd.Parameters["@Sys_Id"].Value.ToString());
                else
                    return 0;
            }
            catch
            {
                throw;
            }
        }
     
        public string Get_User_Permission(string _sp, _clsuser _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@uid", _obj.uid);
            _cmd.Parameters.AddWithValue("@project", _obj.project_code);
            _cmd.Parameters.Add("@permission", SqlDbType.VarChar, 15);
            _cmd.Parameters["@permission"].Direction = ParameterDirection.Output;
            try
            {
                _cmd.ExecuteNonQuery();
                if (_cmd.Parameters["@permission"].Value.ToString() != "")
                    return _cmd.Parameters["@permission"].Value.ToString();
                else
                    return "000000000";
            }
            catch
            {
                throw;
            }
        }
      
        public string Get_ProjectName(string _sp, _clsuser _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@Project", _obj.project_code);
            _cmd.Parameters.Add("@Project_Name", SqlDbType.VarChar, 100);
            _cmd.Parameters["@Project_Name"].Direction = ParameterDirection.Output;
            _cmd.ExecuteNonQuery();
            return _cmd.Parameters["@Project_Name"].Value.ToString();
        }
      
        public void DML_Manufacturer(string _sp, _clsams _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@Manuf_Id", _obj.manufId);
            _cmd.Parameters.AddWithValue("@Manuf_Name", _obj.manufName);
            _cmd.Parameters.AddWithValue("@Action", _obj.action);
            _cmd.ExecuteNonQuery();
        }
     
        public DataTable Load_ScheduleList(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@Project_code", _obj.project_code);
            _cmd.Parameters.AddWithValue("@Folder_Id", _obj.folder_id);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
              
        public DataTable Load_DMSDoc_AMS(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@Folder_Id", _obj.folder_id);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
        public void AMS_Register(string _sp, _clsams _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@AMS_REG_ID", _obj.ams_reg_id);
            _cmd.Parameters.AddWithValue("@PROJECT_REF", _obj.prj_reff);
            _cmd.Parameters.AddWithValue("@SCH_ID", _obj.sch_id);
            _cmd.Parameters.AddWithValue("@SYS_ID", _obj.sys_id);
            _cmd.Parameters.AddWithValue("@BZONE", _obj.bzone);
            _cmd.Parameters.AddWithValue("@CAT", _obj.cat);
            _cmd.Parameters.AddWithValue("@FLEVEL", _obj.flvl);
            _cmd.Parameters.AddWithValue("@SEQ_NO", _obj.seq_no);
            _cmd.Parameters.AddWithValue("@PARENT", _obj.parent);
            _cmd.Parameters.AddWithValue("@POSSITION", _obj.position);
            _cmd.Parameters.AddWithValue("@CAS_ID", _obj.casId);
            _cmd.Parameters.AddWithValue("@LOCATION", _obj.location);
            _cmd.Parameters.AddWithValue("@PARENT_ASSET", _obj.parent_id);
            _cmd.Parameters.AddWithValue("@ACTION", _obj.action);
            _cmd.ExecuteNonQuery();
        }
        public string Get_Category(string _sp, _clscassheet _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@Sys_Id", _obj.sys);
            _cmd.Parameters.Add("@Cate", SqlDbType.VarChar, 10);
            _cmd.Parameters["@Cate"].Direction = ParameterDirection.Output;
            try
            {
                _cmd.ExecuteNonQuery();
                return (string)_cmd.Parameters["@Cate"].Value;
            }
            catch
            {
                throw;
            }
        }
     
       
        public DataTable Load_DMS_TCDOC_SYS(string _sp, _clscassheet _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@PRJ_CODE", _obj.prj_code);
            _cmd.Parameters.AddWithValue("@DMS_FOLDER", _obj.srv);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
       
        public DataTable load_dms_user_email(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@project_code", _obj.project_code);
            _cmd.Parameters.AddWithValue("@srv", _obj.schid);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
        public int Get_Package_Service(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@package", _obj.package_code);
            _cmd.Parameters.Add("@srv", SqlDbType.Int);
            _cmd.Parameters["@srv"].Direction = ParameterDirection.Output;
            try
            {
                _cmd.ExecuteNonQuery();
                if (_cmd.Parameters["@srv"].Value.ToString() != "")
                    return (int)_cmd.Parameters["@srv"].Value;
                else
                    return 0;
            }
            catch
            {
                throw;
            }
        }
        
        public DataTable load_cas_panel(string _sp, _clscassheet _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@sch_id", _obj.sch);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
        
        
        public int get_schedule_possition(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@folder_id", _obj.folder_id);
            _cmd.Parameters.Add("@possition", SqlDbType.Int);
            _cmd.Parameters["@possition"].Direction = ParameterDirection.Output;
            try
            {
                _cmd.ExecuteNonQuery();
                if (_cmd.Parameters["@possition"].Value.ToString() != "")
                    return (int)_cmd.Parameters["@possition"].Value;
                else
                    return 0;
            }
            catch
            {
                throw;
            }
        }
     
        public DataTable load_dms_doc_upload(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@type", _obj.folder_id);
            _cmd.Parameters.AddWithValue("@prj_code", _obj.project_code);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
      
        public int Get_CMS_TC_Count(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@folder_id", _obj.folder_id);
            _cmd.Parameters.Add("@count", SqlDbType.Int);
            _cmd.Parameters["@count"].Direction = ParameterDirection.Output;
            try
            {
                _cmd.ExecuteNonQuery();
                if (_cmd.Parameters["@count"].Value.ToString() != "")
                    return (int)_cmd.Parameters["@count"].Value;
                else
                    return 0;
            }
            catch
            {
                throw;
            }
        }
      
        public DataTable Load_System_List(string _sp, _clscassheet _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@sch_id", _obj.sch);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
      
        public DataTable LOAD_PROJECT_MODULE(string _sp, _clsproject _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@USERID", _obj.user);
            _cmd.Parameters.AddWithValue("@MODULE", _obj.module);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
      
        public string Get_UserName(string _sp, _clsuser _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@userid", _obj.uid);
            _cmd.Parameters.Add("@username", SqlDbType.VarChar, 50);
            _cmd.Parameters["@username"].Direction = ParameterDirection.Output;
            try
            {
                _cmd.ExecuteNonQuery();
                return _cmd.Parameters["@username"].Value.ToString();
            }
            catch
            {
                throw;
            }
        }
       
        public DataTable Get_Folder_Details(string _sp, _clstreefolder _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@Folder_id", _obj.Folder_id);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
       
        public DataTable Get_ProjectInformation(string _sp, _clsproject _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@prj_id", _obj.prj_id);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
        public int Get_Default(string _sp, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.Add("@id", SqlDbType.Int);
            _cmd.Parameters["@id"].Direction = ParameterDirection.Output;
            try
            {
                _cmd.ExecuteNonQuery();
                if (_cmd.Parameters["@id"].Value.ToString() != null)
                    return (int)_cmd.Parameters["@id"].Value;
                else
                    return 0;
            }
            catch
            {
                throw;
            }
        }
       
        public void FileUploadingNew(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@service", _obj.service_code);
            _cmd.Parameters.AddWithValue("@package", _obj.package_code);
            _cmd.Parameters.AddWithValue("@doctype", _obj.doctype_code);
            _cmd.Parameters.AddWithValue("@doc_title", _obj.doc_title);
            _cmd.Parameters.AddWithValue("@doc_name", _obj.doc_name);
            _cmd.Parameters.AddWithValue("@uploaded", _obj.uploaded);
            _cmd.Parameters.AddWithValue("@uploaded_date", _obj.uploaded_date);
            _cmd.Parameters.AddWithValue("@file_size", _obj.file_size);
            _cmd.Parameters.AddWithValue("@schid", _obj.schid);
            _cmd.Parameters.AddWithValue("@folder_id", _obj.folder_id);
            _cmd.Parameters.AddWithValue("@type", _obj.type);
            _cmd.Parameters.AddWithValue("@uid", _obj.uid);
            _cmd.Parameters.AddWithValue("@possition", _obj.possition);
            _cmd.Parameters.AddWithValue("@status", _obj.status);
            _cmd.Parameters.AddWithValue("@version", _obj.Version);
            _cmd.Parameters.AddWithValue("@Manual_title", _obj.Manual_title);
            _cmd.ExecuteNonQuery();

        }

        public void FileUploading_New(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@service", _obj.service_code);
            _cmd.Parameters.AddWithValue("@package", _obj.package_code);
            _cmd.Parameters.AddWithValue("@doctype", _obj.doctype_code);
            _cmd.Parameters.AddWithValue("@doc_title", _obj.doc_title);
            _cmd.Parameters.AddWithValue("@doc_name", _obj.doc_name);
            _cmd.Parameters.AddWithValue("@uploaded", _obj.uploaded);
            _cmd.Parameters.AddWithValue("@uploaded_date", _obj.uploaded_date);
            _cmd.Parameters.AddWithValue("@file_size", _obj.file_size);
            _cmd.Parameters.AddWithValue("@schid", _obj.schid);
            _cmd.Parameters.AddWithValue("@folder_id", _obj.folder_id);
            _cmd.Parameters.AddWithValue("@type", _obj.type);
            _cmd.Parameters.AddWithValue("@uid", _obj.uid);
            _cmd.Parameters.AddWithValue("@possition", _obj.possition);
            _cmd.Parameters.AddWithValue("@status", _obj.status);
            _cmd.Parameters.AddWithValue("@title", _obj.Manual_title);
            _cmd.Parameters.AddWithValue("@Review", _obj.Review);
            _cmd.Parameters.AddWithValue("@DisplayVersion", _obj.DisplayVersion);
            _cmd.Parameters.AddWithValue("@DocStyleId", _obj.DocStyleId);
            _cmd.Parameters.AddWithValue("@DocStyleChange", _obj.DocStyleChange);
            _cmd.Parameters.AddWithValue("@submit", _obj.submit);
            _cmd.Parameters.AddWithValue("@ref", _obj.reff);
            _cmd.ExecuteNonQuery();

        }
        public void Update_documentdetails(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@doc_id", _obj.doc_id);
            _cmd.Parameters.AddWithValue("@doc_title", _obj.doc_title);
            _cmd.Parameters.AddWithValue("@uid", _obj.uid);
            _cmd.Parameters.AddWithValue("@status", _obj.status);
            _cmd.Parameters.AddWithValue("@DisplayVersion", _obj.DisplayVersion);
            _cmd.Parameters.AddWithValue("@Manual_title", _obj.Manual_title);
            _cmd.Parameters.AddWithValue("@DocStyleId", _obj.DocStyleId);
            _cmd.Parameters.AddWithValue("@DocStyleChange", _obj.DocStyleChange);
            _cmd.Parameters.AddWithValue("@folder_id", _obj.folder_id);
            _cmd.ExecuteNonQuery();
        }
        public void Delete_DocumentNew(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@doc_id", _obj.doc_id);
            _cmd.Parameters.AddWithValue("@possition", _obj.possition);
            _cmd.Parameters.AddWithValue("@folder_Id", _obj.folder_id);
            _cmd.ExecuteNonQuery();
        }
        public string Get_DocumentTitle(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@doc_id", _obj.doc_id);
            _cmd.Parameters.Add("@title", SqlDbType.VarChar, 200);
            _cmd.Parameters["@title"].Direction = ParameterDirection.Output;
            try
            {
                _cmd.ExecuteNonQuery();
                if (_cmd.Parameters["@title"].Value.ToString() != "")
                    return (string)_cmd.Parameters["@title"].Value;
                else
                    return "";
            }
            catch
            {
                throw;
            }
        }
        public void dml_schedule_basket(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@SCH_ITM_ID", _obj.schid);
            _cmd.Parameters.AddWithValue("@PRJ_CODE", _obj.project_code);
            _cmd.Parameters.AddWithValue("@USERID", _obj.uid);
            _cmd.Parameters.AddWithValue("@DOCUMENT_TITLE", _obj.doc_title);
            _cmd.Parameters.AddWithValue("@FOLDER_ID", _obj.folder_id);
            _cmd.Parameters.AddWithValue("@FILE_NAME", _obj.doc_name);
            _cmd.Parameters.AddWithValue("@PARTY_ID", _obj.party_id);
            _cmd.Parameters.AddWithValue("@PARTY_NAME", _obj.party_name);
            _cmd.Parameters.AddWithValue("@REF_NO", _obj.reff);
            _cmd.Parameters.AddWithValue("@ACTION", _obj.action);
            _cmd.ExecuteNonQuery();
        }
        public DataTable Load_ScheduleBasket(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@FOLDER_ID", _obj.folder_id);
            _cmd.Parameters.AddWithValue("@USERID", _obj.uid);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
        public void Move_Folder(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@folder_id", _obj.folder_id);
            _cmd.Parameters.AddWithValue("@possition", _obj.possition);
            _cmd.Parameters.AddWithValue("@move", _obj.move);
            _cmd.ExecuteNonQuery();
        }
        public void CreateDocSchedule(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@service", _obj.service_code);
            _cmd.Parameters.AddWithValue("@package", _obj.package_code);
            _cmd.Parameters.AddWithValue("@doctype", _obj.doctype_code);
            _cmd.Parameters.AddWithValue("@doc_title", _obj.party_name);
            _cmd.Parameters.AddWithValue("@doc_name", _obj.doc_name);
            _cmd.Parameters.AddWithValue("@date_tobeuploaded", _obj.uploaded_date);
            _cmd.Parameters.AddWithValue("@Folder_id", _obj.folder_id);
            _cmd.Parameters.AddWithValue("@Project_code", _obj.project_code);
            _cmd.Parameters.AddWithValue("@uid", _obj.uid);
            _cmd.Parameters.AddWithValue("@possition", _obj.possition);
            _cmd.Parameters.AddWithValue("@title", _obj.doc_title);
            _cmd.Parameters.AddWithValue("@doc_ref", _obj.reff);
            _cmd.ExecuteNonQuery();
        }
        public void Create_Schedulebskt(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@FOLDER_ID", _obj.folder_id);
            _cmd.Parameters.AddWithValue("@USERID", _obj.uid);
            _cmd.ExecuteNonQuery();
        }
        public void Delete_DocumentStyle(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@DocStyleId", _obj.DocStyleId);
            _cmd.ExecuteNonQuery();
        }
        public int Check_Record_Exits(string _sp, _clsmanufacture _obj, _database _objdb)
        {

            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));

            _cmd.CommandType = CommandType.StoredProcedure;

            _cmd.Parameters.AddWithValue("@name", _obj.man_name);

            _cmd.Parameters.AddWithValue("@Project_code", _obj.project_code);

            _cmd.Parameters.Add("@id", SqlDbType.Int, 6);

            _cmd.Parameters["@id"].Direction = ParameterDirection.Output;

            try
            {

                _cmd.ExecuteNonQuery();

                if (_cmd.Parameters["@id"].Value.ToString() != "")

                    return Convert.ToInt16(_cmd.Parameters["@id"].Value);

                else

                    return 0;

            }

            catch
            {

                throw;

            }

        }
        public DataTable Load_Document_Submit(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@folder_id", _obj.folder_id);
            _cmd.Parameters.AddWithValue("@userid", _obj.uid);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
        public void Update_Document_Submit(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@doc_id", _obj.doc_id);
            _cmd.Parameters.AddWithValue("@title", _obj.doc_title);
            _cmd.Parameters.AddWithValue("@userid", _obj.uid);
            _cmd.Parameters.AddWithValue("@action", _obj.action);
            _cmd.ExecuteNonQuery();
        }
        public DataTable Load_AllProgressTracking(string _sp, _clsProgressTracking _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@Folder_id", _obj.Folder_id);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
       
        public DataTable Load_DMS_Report_Master(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@prj_code", _obj.project_code);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
        public void Update_Document_direct(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@doc_id", _obj.doc_id);
            _cmd.Parameters.AddWithValue("@title", _obj.doc_name);
            _cmd.Parameters.AddWithValue("@doc_title", _obj.doc_title);
            _cmd.Parameters.AddWithValue("@doc_ref", _obj.reff);
            _cmd.Parameters.AddWithValue("@userid", _obj.uid);
            _cmd.Parameters.AddWithValue("@action", _obj.action);
            _cmd.ExecuteNonQuery();
        }
        public void Update_Schedule_direct(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@sch_id", _obj.doc_id);
            _cmd.Parameters.AddWithValue("@doc_title", _obj.doc_title);
            _cmd.Parameters.AddWithValue("@doc_name", _obj.doc_name);
            _cmd.Parameters.AddWithValue("@title", _obj.title);
            _cmd.Parameters.AddWithValue("@doc_ref", _obj.reff);
            _cmd.Parameters.AddWithValue("@action", _obj.action);
            _cmd.ExecuteNonQuery();
        }
        public void Create_TreeFolderNew(string _sp, _clstreefolder _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@Folder_description", _obj.Folder_description);
            _cmd.Parameters.AddWithValue("@Folder_code", _obj.Folder_code);
            _cmd.Parameters.AddWithValue("@Folder_type", _obj.Folder_type);
            _cmd.Parameters.AddWithValue("@Folder_possition", _obj.Folder_possition);
            _cmd.Parameters.AddWithValue("@Parent_folder", _obj.Parent_folder);
            _cmd.Parameters.AddWithValue("@Project_code", _obj.Project_code);
            _cmd.Parameters.AddWithValue("@Enabled", _obj.Enabled);
            _cmd.Parameters.AddWithValue("@auto", _obj.auto);
            _cmd.Parameters.AddWithValue("@Userid", _obj.Userid);
            _cmd.ExecuteNonQuery();
        }
        public void Edit_Tree_Folder_New(string _sp, _clstreefolder _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@Folder_id", _obj.Folder_id);
            _cmd.Parameters.AddWithValue("@Folder_code", _obj.Folder_code);
            _cmd.Parameters.AddWithValue("@Folder_description", _obj.Folder_description);
            _cmd.Parameters.AddWithValue("@mode", _obj.mode);
            _cmd.ExecuteNonQuery();
        }
      
        public void Update_ProgressTracking_tbl(string _sp, _clsProgressTracking _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@Progress_Id", _obj.Progress_id);
            _cmd.Parameters.AddWithValue("@Folder_id", _obj.Folder_id);
            _cmd.Parameters.AddWithValue("@Value", _obj.Value);
            _cmd.Parameters.AddWithValue("@User_id", _obj.Userid);
            _cmd.Parameters.AddWithValue("@Type", _obj.Type);
            _cmd.ExecuteNonQuery();
        }
      
        public void addcomment_new(string _sp, _clscomment _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@sec_no", _obj.sec_no);
            _cmd.Parameters.AddWithValue("@page_no", _obj.page_no);
            _cmd.Parameters.AddWithValue("@comment", _obj.comment);
            _cmd.Parameters.AddWithValue("@com_date", _obj.com_date);
            _cmd.Parameters.AddWithValue("@user_id", _obj.user_id);
            _cmd.Parameters.AddWithValue("@doc_id", _obj.doc_id);
            _cmd.Parameters.AddWithValue("@Image_name", _obj.Image_name);
            _cmd.ExecuteNonQuery();
        }
        public void Editcomment_new(string _sp, _clscomment _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@comment", _obj.comment);
            _cmd.Parameters.AddWithValue("@user_id", _obj.user_id);
            _cmd.Parameters.AddWithValue("@comm_id", _obj.comm_id);
            _cmd.Parameters.AddWithValue("@Image_name", _obj.Image_name);
            _cmd.ExecuteNonQuery();
        }
        public DataTable load_CommentDetails(string _sp, _clscomment _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@comm_id", _obj.comm_id);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
        public void dml_amslocation(string _sp, _clsams _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@location_id", _obj.id);
            _cmd.Parameters.AddWithValue("@location_name", _obj.location);
            _cmd.Parameters.AddWithValue("@action", _obj.action);
            _cmd.ExecuteNonQuery();
        }
        public void dml_amsroom(string _sp, _clsams _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@room_id", _obj.id);
            _cmd.Parameters.AddWithValue("@room_name", _obj.location);
            _cmd.Parameters.AddWithValue("@action", _obj.action);
            _cmd.ExecuteNonQuery();
        }
               
        public DataTable Load_Document_Library_Project(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@prj_code", _obj.project_code);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }

        public DataTable Generate_DocumentStatus_Other(string _sp, _clscmsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@Project_code", _obj.project_code);
            _cmd.Parameters.AddWithValue("@Service_id", _obj.srv_id);
            _cmd.Parameters.AddWithValue("@Type", _obj.Type);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
      
        public int Get_Document_Library_Count(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@Itm_id", _obj.doc_id);
            _cmd.Parameters.AddWithValue("@folder_id", _obj.folder_id);
            _cmd.Parameters.Add("@count", SqlDbType.Int);
            _cmd.Parameters["@count"].Direction = ParameterDirection.Output;
            try
            {
                _cmd.ExecuteNonQuery();
                if (_cmd.Parameters["@count"].Value.ToString() != "")
                    return (int)_cmd.Parameters["@count"].Value;
                else
                    return 0;
            }
            catch
            {
                throw;
            }
        }
        public void dml_dms_library_general_new(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@itm_id", _obj.doc_id);
            _cmd.Parameters.AddWithValue("@srv_id", _obj.service_code);
            _cmd.Parameters.AddWithValue("@pkg_id", _obj.schid);
            _cmd.Parameters.AddWithValue("@man_id", _obj.party_id);
            _cmd.Parameters.AddWithValue("@contra_type", _obj.type);
            _cmd.Parameters.AddWithValue("@model", _obj.doc_title);
            _cmd.Parameters.AddWithValue("@file_name", _obj.doc_name);
            _cmd.Parameters.AddWithValue("@source", _obj.reff);
            _cmd.Parameters.AddWithValue("@action", _obj.action);
            _cmd.Parameters.AddWithValue("@File_Size", _obj.file_size);
            _cmd.ExecuteNonQuery();
        }
        public void AddToProject_Library(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@itm_id", _obj.doc_id);
            _cmd.Parameters.AddWithValue("@Folder_Id", _obj.folder_id);
            _cmd.Parameters.AddWithValue("@prj_code", _obj.project_code);
            _cmd.Parameters.AddWithValue("@uid", _obj.uid);
            _cmd.ExecuteNonQuery();
        }
       
        public DataTable Load_Buildinglevel_Navigation(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@prj", _obj.project_code);
            _dta = new SqlDataAdapter(_cmd);
            DataTable _dtable = new DataTable();
            _dta.Fill(_dtable);
            return _dtable;
        }
        
        public void Delete_DMS_Document_New(string _sp, _clsdocument _obj, _database _objdb)
        {
            _cmd = new SqlCommand(_sp, _objcon.con_open(_objdb.DBName));
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.Parameters.AddWithValue("@doc_id", _obj.doc_id);
            _cmd.Parameters.AddWithValue("@uid", _obj.uid);
            _cmd.ExecuteNonQuery();
        }
                
    }
}
