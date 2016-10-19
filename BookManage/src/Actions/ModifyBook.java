package Actions;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import ActionFromat.BookFromat;
import DAO.BookDao;

public class ModifyBook extends ActionSupport
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
    	 System.out.println("****************");
     	System.out.println(form.getTitle());
     	System.out.println(form.getPublishDate());
     	System.out.println(form.getPublisher());
     	System.out.println("啊啊啊");
     	System.out.println("****************");
     	int q=BookDao.addquery(form.getAuthorID());
		if (q==1)
		{
			 int ret=BookDao.update(form);
	    	 
	         if(ret==0)
	         {
	             return "FAILED";		//转到错误提示页面
	         }
	         else
	         {
	             return SUCCESS;	//转到修改成功页面
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
