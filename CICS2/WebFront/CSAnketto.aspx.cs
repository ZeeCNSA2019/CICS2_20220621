using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CICS2.WebFront
{
    public partial class CSAnketto : System.Web.UI.Page
    {
        MySqlConnection con;
        DataTable dt_anketto = new DataTable();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Year();
                string question_sql = "";
                question_sql += "";
                DDL_nendou.DataBind();
                ReadData();
            }
            else
            {
                DDL_nendou.DataBind();
                ReadData();
            }
        }

        public void connection()
        {
            string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["SQLDbConnection"].ToString();
            con = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        }

        public void ReadData()
        {
            string sql = " SELECT ress.id  as id  ";
            sql += " ,ress.ess_id as ess_id ";
            sql += " ,ress.name as name ";
            sql += " ,ress.number_of_time as kaisu ";
            sql += " ,ress.type  as type ";
            sql += ",ress.category_id as category";
            sql += " ,rans.answer_1 as ans1 ";
            sql += " ,rans.answer_2 as ans2 ";
            sql += " ,'' as rd1 ";
            sql += " ,'' as rd2 ";
            sql += " ,'' as rd3 ";
            sql += " ,'' as rd4 ";
            sql += " ,'' as rd5 ";
            sql += " FROM r_ess  ress Left JOIN r_ans_ess rans  ";
            sql += " on ress.ess_id = rans.r_ess_id  ";
            sql += " where ress.fiscal_year = 2022  ";
            sql += "order by ress.category_id,ress.ess_id;";
            connection();
            con.Open();
            MySqlCommand cmd = new MySqlCommand(sql, con);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            da.SelectCommand = cmd;
            da.Fill(dt_anketto);
            if (dt_anketto.Rows.Count > 0)
            {
                gv_anketto.DataSource = dt_anketto;
                gv_anketto.DataBind();
            }
            con.Close();

        }
        public void Year()
        {
            connection();
            //string Yearsql = "select now()";
            //con.Open();
            //MySqlCommand cmd = new MySqlCommand(Yearsql);
            //string date = cmd.ExecuteScalar().ToString();
            //con.Close();
            con.Open();
            string checkYear = "select fiscal_year from r_ess;";
            MySqlCommand cmd = new MySqlCommand(checkYear,con);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.SelectCommand = cmd;
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                string date = dt.Rows[0]["fiscal_year"].ToString();
                if (date != "")
                {
                    DDL_nendou.Items.Add(date);
                }
            }
            con.Close();
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            //string value = "";
            //for(int i = 0; i < gv_anketto.Rows.Count; i++)
            //{
            //    value = gv_anketto.Rows[i].Cells[0].Text;
            //}
            //for (int i = 0; i < tb_anketto.Rows.Count; i++)
            //{
            //    //string name = tb_anketto.Rows[i+2].Cells[0].InnerText.ToString();
            //    //string val1 = tbl_anketto.Rows[i].Cells[1].InnerText.ToString();
            //    var val2 = (RadioButton)tb_anketto.Rows[i+2].Cells[1].FindControl("rdo_test1");
            //    bool fval2 = val2.Checked;
            //    var val3 = (RadioButton)tb_anketto.Rows[i].Cells[1].FindControl("rdo_test1");
            //    bool fval3 = val3.Checked;

            //}
        }

        protected void btn_soushin_Click(object sender, EventArgs e)
        {
        }

        protected void OnDataBound(object sender, EventArgs e)
        {
            string now_id = "";
            string type_id = "";
            string past_id = "";
            int nplus = 0;
            for (int i = 0; i < dt_anketto.Rows.Count; i++)
            {
                type_id = dt_anketto.Rows[i]["type"].ToString();
                now_id = dt_anketto.Rows[i]["category"].ToString();
                if (now_id != past_id)
                {
                    GridViewRow row = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal);
                    TableHeaderCell cell = new TableHeaderCell();
                    int idx = i + 1;
                    if (type_id == "2")
                    {
                        Label lbl_cat = new Label();
                        lbl_cat.Text = "その他";
                        cell.ColumnSpan = 2;
                        lbl_cat.BorderStyle = BorderStyle.None;
                        lbl_cat.BackColor = Color.Gainsboro;
                        lbl_cat.ForeColor = Color.Black;
                        lbl_cat.CssClass += "gv_headers ";
                        lbl_cat.CssClass += "rowadd";
                        cell.Controls.Add(lbl_cat);
                        row.Controls.Add(cell);
                        nplus = nplus + 1;
                        gv_anketto.HeaderRow.Parent.Controls.AddAt(idx + nplus, row);
                        GridViewRow gvRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
                        TableHeaderCell cell1 = new TableHeaderCell();
                        TextBox tb_sonota = new TextBox();

                        //TextBoxControlBuilder tb_sonota = new TextBoxControlBuilder();
                        tb_sonota.Text = "テキスト";
                        cell1.ColumnSpan = 2;
                        tb_sonota.BorderStyle = BorderStyle.Solid;
                        //tb_sonota.Width = 100;
                        tb_sonota.CssClass+= "jiyutext";
                        tb_sonota.Rows = 10;
                        tb_sonota.TextMode = TextBoxMode.MultiLine;
                        cell1.Controls.Add(tb_sonota);
                        gvRow.Controls.Add(cell1);
                        nplus = nplus + 2;
                        gv_anketto.HeaderRow.Parent.Controls.AddAt(idx + nplus, gvRow);
                    }
                    else
                    {
                        if (past_id == "")
                        {
                            Label lbl_cat = new Label();
                            lbl_cat.Text = "CategoryID" + idx;
                            cell.ColumnSpan = 2;
                            lbl_cat.BorderStyle = BorderStyle.None;
                            lbl_cat.BackColor = Color.Gainsboro;
                            lbl_cat.ForeColor = Color.Black;
                            lbl_cat.CssClass += "gv_headers";
                            cell.Controls.Add(lbl_cat);
                            row.Controls.Add(cell);
                            gv_anketto.HeaderRow.Parent.Controls.AddAt(idx, row);
                        }
                        else
                        {
                            Label lbl_cat = new Label();
                            lbl_cat.Text = "CategoryID" + idx;
                            cell.ColumnSpan = 2;
                            lbl_cat.BorderStyle = BorderStyle.None;
                            lbl_cat.BackColor = Color.Gainsboro;
                            lbl_cat.ForeColor = Color.Black;
                            lbl_cat.CssClass += "gv_headers ";
                            lbl_cat.CssClass += "rowadd";
                            cell.Controls.Add(lbl_cat);
                            row.Controls.Add(cell);
                            nplus = nplus + 1;
                            gv_anketto.HeaderRow.Parent.Controls.AddAt(idx + nplus, row);
                        }
                    }
                    
                    
                }
                
                past_id = now_id;
            }
            if (type_id == "2")
            {
                GridViewRow gvRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
                TableHeaderCell cell1 = new TableHeaderCell();
            }
        }

        protected void gv_anketto_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            int rowidx = e.Row.RowIndex;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                HiddenField hdnt = (HiddenField)e.Row.FindControl("hdntype");
                string typeid = hdnt.Value;
                if (typeid == "2")
                {
                    Label lb1 = (Label)e.Row.FindControl("Label6");
                    lb1.Visible = false;
                    Label lb2 = (Label)e.Row.FindControl("Label7");
                    lb2.Visible = false;
                    Label lb3 = (Label)e.Row.FindControl("Label8");
                    lb3.Visible = false;
                    Label lb4 = (Label)e.Row.FindControl("Label9");
                    lb4.Visible = false;
                    Label lb5 = (Label)e.Row.FindControl("Label10");
                    lb5.Visible = false;
                    RadioButton rb1 = (RadioButton)e.Row.FindControl("rdo_1");
                    rb1.Visible = false;
                    RadioButton rb2 = (RadioButton)e.Row.FindControl("rdo_2");
                    rb2.Visible = false;
                    RadioButton rb3 = (RadioButton)e.Row.FindControl("rdo_3");
                    rb3.Visible = false;
                    RadioButton rb4 = (RadioButton)e.Row.FindControl("rdo_4");
                    rb4.Visible = false;
                    RadioButton rb5 = (RadioButton)e.Row.FindControl("rdo_5");
                    rb5.Visible = false;
                }
                
                string count = e.Row.Cells.Count.ToString();
            }
        }
    }
}