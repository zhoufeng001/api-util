package api;

public class HtmlFormatUtil {

	public static String toHTMLString(String in)   
	{   
		StringBuffer out = new StringBuffer();   
		for(int i = 0; in != null && i < in.length(); i++)   
		{   
			char   c   =   in.charAt(i);   
			if   (c   ==   '\'')   
				out.append("&#039;");   
			else   if   (c == '\"')   
				out.append("&#034;");   
			else   if   (c == '<')   
				out.append("&lt;");   
			else   if   (c == '>') 
				out.append("&gt;");   
			else   if   (c == '&')   
				out.append("&amp;");   
			else   if   (c == ' ')   
				out.append("&nbsp;");   
			else   if   (c   ==   '\n')   
				out.append("");   
			else   
				out.append(c);   
		}   
		return   out.toString();   
	}

}
