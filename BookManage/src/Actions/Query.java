package Actions;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import ActionFromat.BookFromat;
import DAO.BookDao;

import com.opensymphony.xwork2.ActionSupport;

public class Query extends ActionSupport
{
	private String select;
	private String key;
	
	public String getSelect() {
		return select;
	}

	public void setSelect(String select) {
		this.select = select;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String execute() throws Exception
	{
		ServletActionContext.getRequest().setAttribute("ifbook", BookDao.query(key,select));
		return SUCCESS;
	}
}