package Actions;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import ActionFromat.BookFromat;
import DAO.BookDao;

import com.opensymphony.xwork2.ActionSupport;

public class AddBook extends ActionSupport
{
	 private BookFromat form = new BookFromat();  
	 public void setForm(BookFromat form){  
         this.form=form;  
     }  
     public BookFromat getForm(){  
         return this.form;  
     }  
	public String execute() throws Exception
	{
		//System.out.println(form.getTitle());
		int q=BookDao.addquery(form.getAuthorID());
		if (q==1)
		{
			int a=BookDao.insert(form);
			if(a==1)
			{
			return SUCCESS;
			}
			else if(a==2)
			{
			return "EXIST";
			}
			else
			{
			return "FAILED";
			}
		}
		else if(q==2)
		{
			ServletActionContext.getRequest().setAttribute("book", form);
			return "Addauthor";
		}
		else
			return "FAILED";
		

}
}
