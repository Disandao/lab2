package Actions;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import ActionFromat.AuthorFormat;
import ActionFromat.BookFromat;
import DAO.AuthorDao;
import DAO.BookDao;

import com.opensymphony.xwork2.ActionSupport;

public class Addauthor extends ActionSupport
{
	private AuthorFormat form = new AuthorFormat();  
	public AuthorFormat getForm() {
		return form;
	}

	public void setForm(AuthorFormat form) {
		this.form = form;
	}
	
	private BookFromat coll = new BookFromat();  
	public BookFromat getColl() {
		return coll;
	}

	public void setColl(BookFromat coll) {
		this.coll = coll;
	}

	public String execute() throws Exception
	{
		int a=AuthorDao.insert(form);
		if(a==1)
		{
			BookDao.insert(coll);
			BookDao.update(coll);
			return SUCCESS;
		}
		else
		{
		return "FAILED";
		}
		

}
}
