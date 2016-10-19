package Actions;
import java.util.Collection;
import java.util.Iterator;

import com.opensymphony.xwork2.ActionSupport;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import ActionFromat.BookFromat;
import DAO.BookDao;;
public class ListBook extends ActionSupport
{
	public String execute() throws Exception
	{
		HttpServletRequest request = null;
		String str = null;
		Collection q = null;
		q = BookDao.list();
		ServletActionContext.getRequest().setAttribute("book", q);
		return SUCCESS;
	}

	
}
