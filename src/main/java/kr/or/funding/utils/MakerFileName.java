//package kr.or.funding.utils;
//
//import java.util.ArrayList;
//import java.util.List;
//import java.util.UUID;
//
//import kr.or.ddit.dto.AttachVO;
//
//public class MakerFileName {
//	
//	private static String delimiter="$$";
//	
//	public static String toUUIDFileName(String fileName, String delimiter) {
//		String uuid = UUID.randomUUID().toString().replace("-", "");
//		if(delimiter != null && !delimiter.isEmpty()) MakerFileName.delimiter = delimiter;
//		return uuid + MakerFileName.delimiter + fileName;
//	}
//	
//	public static String parseFileNameFromUUID(String fileName, String delimiter) {
//		if(delimiter != null && !delimiter.isEmpty()) MakerFileName.delimiter = delimiter;
//		String[] uuidFileName = fileName.split(MakerFileName.delimiter);
//		return uuidFileName[uuidFileName.length - 1 ];
//	}
//	
//	public static List<AttachVO> parseFileNameFromAttaches(List<AttachVO> attachList, String delimiter){
//		List<AttachVO> renamedAttachList = new ArrayList<AttachVO>();
//		
//		if(attachList != null) {
//			for(AttachVO attach : attachList) {
//				String fileName = attach.getFileName();
//				fileName = parseFileNameFromUUID(fileName, delimiter);
//				
//				attach.setFileName(fileName);
//				
//				renamedAttachList.add(attach);
//			}
//		}
//		return renamedAttachList;
//	}
//}
