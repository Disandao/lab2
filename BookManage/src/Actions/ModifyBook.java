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
     	System.out.println("������");
     	System.out.println("****************");
     	int q=BookDao.addquery(form.getAuthorID());
		if (q==1)
		{
			 int ret=BookDao.update(form);
	    	 
	         if(ret==0)
	         {
	             return "FAILED";		//ת��������ʾҳ��
	         }
	         else
	         {
	             return SUCCESS;	//ת���޸ĳɹ�ҳ��
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
