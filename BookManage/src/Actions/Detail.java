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

public class Detail extends ActionSupport
{
	private String ISBN;
	private int AuthorID;
	public int getAuthorID() {
		return AuthorID;
	}
	public void setAuthorID(int authorID) {
		AuthorID = authorID;
	}
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
		AuthorFormat authorForm = new AuthorFormat();
		authorForm.setAuthorID(AuthorID);
        bookForm.setISBN(ISBN);
        ServletActionContext.getRequest().setAttribute("bookDetail", BookDao.queryM(bookForm));
        ServletActionContext.getRequest().setAttribute("authorDetail",AuthorDao.queryM(authorForm));
		return SUCCESS;
	}
		
         

}