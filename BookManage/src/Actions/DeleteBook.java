package Actions;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import ActionFromat.BookFromat;
import DAO.BookDao;

import com.opensymphony.xwork2.ActionSupport;

public class DeleteBook extends ActionSupport
{
	private String ISBN;
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String execute() throws Exception
	{
		//System.out.println(ServletActionContext.getRequest().getParameter("ISBN"));
		//System.out.println(ISBN);
		BookFromat bookForm=new BookFromat();
        bookForm.setISBN(ISBN);
        int ret=BookDao.delete(bookForm);
        if(ret==0)
        {
            return "FAILED";
        }
        else
        {
            return SUCCESS;
        }
        
	}	
         
}