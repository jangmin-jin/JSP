package util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class Cookies {
	private HashMap<String, Cookie> cookieMap;
	
	// 생성자
	public Cookies(HttpServletRequest request) {
		cookieMap = new HashMap<String, Cookie>();
		
		// 존재하는 모든 쿠키들을 cookieMap에 정리하여 집어넣는다.
		Cookie[] cookies = request.getCookies();
		if( cookies != null ) {
			for( int i=0; i<cookies.length; i++) {
				cookieMap.put(cookies[i].getName(), cookies[i]);
			}
		}
	}
	
	public boolean exists( String name ) {
		// true false 리턴한다.
		return cookieMap.get(name) != null;
	}
	
	public Cookie getCookie( String name ) {
		// 쿠키의 이름을 리턴한다.
		return cookieMap.get(name);
	}
	
	public String getValue( String name ) throws UnsupportedEncodingException {
		Cookie cookie = cookieMap.get(name);
		if(cookie == null) {
			return null;
		}
		// utf-8 형식으로 디코딩하여 쿠키의 이름을 리턴한다.
		return URLDecoder.decode(cookie.getValue(), "utf-8");
	}
	
	public static Cookie createCookie( String name, String value ) throws UnsupportedEncodingException {
		// 입력한 name 과 value를 토대로 cookie를 생성한다.
		// 만들어진 쿠키를 리턴한다.
		Cookie cookie = new Cookie(name, URLEncoder.encode(value, "utf-8"));
		return cookie;
	}
}