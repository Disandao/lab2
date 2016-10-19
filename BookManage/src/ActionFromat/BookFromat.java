package ActionFromat;

public class BookFromat {
    
    private String ISBN;
    private String Title;
    private int authorID;
    private Float price;
    private String publisher;
    private String publishDate;
    public BookFromat()
    {
    }
  
    public void setPublisher(String publisher) 
    {
        this.publisher = publisher;
    }

    public void setPrice(Float price) 
    {
        this.price = price;
    }


    public void setTitle(String title) 
    {
        this.Title = title;
    }

    public void setISBN(String isbn) 
    {
        this.ISBN = isbn;
    }

    public void setAuthorID(int authorID) 
    {
        this.authorID = authorID;
    }

    public void setPublishDate(String publishDate) 
    {
        this.publishDate = publishDate;
    }


    public String getPublisher() 
    {
        return publisher;
    }

    public String getISBN() 
    {
        return ISBN;
    }

    public String getTitle() 
    {
        return Title;
    }

    public int getAuthorID() 
    {
        return authorID;
    }

    public String getPublishDate() 
    {
        return publishDate;
    }

    public Float getPrice()
    {
        return price;
    }

   

}