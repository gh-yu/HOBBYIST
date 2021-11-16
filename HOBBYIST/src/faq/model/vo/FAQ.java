package faq.model.vo;

public class FAQ {
	
	private int faqNo;
	private String faqCategory;
	private String faqTitle;
//	private String faqContent;
	private String faqReply;
	
	
	public FAQ() {}


	public FAQ(int faqNo, String faqCategory, String faqTitle, String faqReply) {
		super();
		this.faqNo = faqNo;
		this.faqCategory = faqCategory;
		this.faqTitle = faqTitle;
//		this.faqContent = faqContent;
		this.faqReply = faqReply;
	}


	public int getFaqNo() {
		return faqNo;
	}


	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}


	public String getFaqCategory() {
		return faqCategory;
	}


	public void setFaqCategory(String faqCategory) {
		this.faqCategory = faqCategory;
	}


	public String getFaqTitle() {
		return faqTitle;
	}


	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}


//	public String getFaqContent() {
//		return faqContent;
//	}
//
//
//	public void setFaqContent(String faqContent) {
//		this.faqContent = faqContent;
//	}


	public String getFaqReply() {
		return faqReply;
	}


	public void setFaqReply(String faqReply) {
		this.faqReply = faqReply;
	}


	@Override
	public String toString() {
		return "FAQ [faqNo=" + faqNo + ", faqCategory=" + faqCategory + ", faqTitle=" + faqTitle + ", faqContent="
				+ ", faqReply=" + faqReply + "]";
	}

}