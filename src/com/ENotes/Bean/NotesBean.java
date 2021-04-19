package com.ENotes.Bean;

import java.util.Date;

public class NotesBean {

	private int id;
	private String title;
	private String contents;
	private Date ndate;
	private int userId;

	public NotesBean() {
		super();
	}

	public NotesBean(int id, String title, String contents, Date ndate, int userId) {
		super();
		this.id = id;
		this.title = title;
		this.contents = contents;
		this.ndate = ndate;
		this.userId = userId;
	}

	public NotesBean(String title, String contents, Date ndate, int userId) {
		super();
		this.title = title;
		this.contents = contents;
		this.ndate = ndate;
		this.userId = userId;
	}

	public NotesBean(String title, String contents) {
		super();
		this.title = title;
		this.contents = contents;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getNdate() {
		return ndate;
	}

	public void setNdate(Date ndate) {
		this.ndate = ndate;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "NotesBean [id=" + id + ", title=" + title + ", contents=" + contents + ", ndate=" + ndate + ", userId="
				+ userId + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((contents == null) ? 0 : contents.hashCode());
		result = prime * result + id;
		result = prime * result + ((ndate == null) ? 0 : ndate.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + userId;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		NotesBean other = (NotesBean) obj;
		if (contents == null) {
			if (other.contents != null)
				return false;
		} else if (!contents.equals(other.contents))
			return false;
		if (id != other.id)
			return false;
		if (ndate == null) {
			if (other.ndate != null)
				return false;
		} else if (!ndate.equals(other.ndate))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (userId != other.userId)
			return false;
		return true;
	}

}
