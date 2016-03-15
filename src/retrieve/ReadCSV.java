package retrieve;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class ReadCSV {
	
	public StringBuffer sb1 = new StringBuffer();
	public StringBuffer sb2 = new StringBuffer();
	public StringBuffer sb3 = new StringBuffer();
	public StringBuffer sb4 = new StringBuffer();

	
	public static void main(String[] args){
		ReadCSV obj = new ReadCSV();
		obj.run();
	}
	
	public void run(){
		String csvFile = "D:\\seokhyun\\SmartAgeing\\data\\samples2.csv";
		BufferedReader br1 = null;
		BufferedReader br2 = null;
		BufferedReader br3 = null;
		BufferedReader br4 = null;
		String line = "";
		String csvSplitBy = ",";
		
		try{
			sb1.append("[");
			boolean start = false;
			br1 = new BufferedReader(new FileReader(csvFile));
			while((line = br1.readLine()) != null){
				//use comma as separator
				String[] number = line.split(csvSplitBy);
				//System.out.println(number[1]);
				if(!start){
					sb1.append("\"").append(number[1]).append("\"");
					start=true;
				}
				else
					sb1.append(",").append("\"").append(number[1]).append("\"");
			}
			sb1.append("]");

		}catch(FileNotFoundException e){
			e.printStackTrace();
		}catch(IOException e){
			e.printStackTrace();
		}finally{
			if(br1 != null){
				try{
					br1.close();
				}catch(IOException e){
					e.printStackTrace();
				}
			}
		}
		
		try{
			sb2.append("[");
			boolean start = false;
			br2 = new BufferedReader(new FileReader(csvFile));
			while((line = br2.readLine()) != null){
				//use comma as separator
				String[] number = line.split(csvSplitBy);
				//System.out.println(number[1]);
				if(!start){
					sb2.append("\"").append(number[2]).append("\"");
					start=true;
				}
				else
				    sb2.append(",").append("\"").append(number[2]).append("\"");
			}
			sb2.append("]");

		}catch(FileNotFoundException e){
			e.printStackTrace();
		}catch(IOException e){
			e.printStackTrace();
		}finally{
			if(br2 != null){
				try{
					br2.close();
				}catch(IOException e){
					e.printStackTrace();
				}
			}
		}
		
		try{
			sb3.append("[");
			boolean start = false;
			br3 = new BufferedReader(new FileReader(csvFile));
			while((line = br3.readLine()) != null){
				//use comma as separator
				String[] number = line.split(csvSplitBy);
				//System.out.println(number[1]);
				if(!start){
					sb3.append("\"").append(number[3]).append("\"");
					start=true;
				}
				else
				    sb3.append(",").append("\"").append(number[3]).append("\"");
			}
			sb3.append("]");

		}catch(FileNotFoundException e){
			e.printStackTrace();
		}catch(IOException e){
			e.printStackTrace();
		}finally{
			if(br3 != null){
				try{
					br3.close();
				}catch(IOException e){
					e.printStackTrace();
				}
			}
		}
		
		try{
			sb4.append("[");
			boolean start = false;
			br4 = new BufferedReader(new FileReader(csvFile));
			while((line = br4.readLine()) != null){
				//use comma as separator
				String[] number = line.split(csvSplitBy);
				//System.out.println(number[1]);
				if(!start){
					sb4.append("\"").append(number[4]).append("\"");
					start=true;
				}
				else
				    sb4.append(",").append("\"").append(number[4]).append("\"");
			}
			sb4.append("]");

		}catch(FileNotFoundException e){
			e.printStackTrace();
		}catch(IOException e){
			e.printStackTrace();
		}finally{
			if(br4 != null){
				try{
					br4.close();
				}catch(IOException e){
					e.printStackTrace();
				}
			}
		}
		
		System.out.println("Done");
		
	}
	
	public String readBuffer1(){
		System.out.println(sb1.toString());
		return sb1.toString();
	}
	
	public String readBuffer2(){
		System.out.println(sb2.toString());
		return sb2.toString();
	}
	
	public String readBuffer3(){
		System.out.println(sb3.toString());
		return sb2.toString();
	}
	
	public String readBuffer4(){
		System.out.println(sb4.toString());
		return sb2.toString();
	}
	
	public StringBuffer readStringBuffer1(){
		return sb1;
	}
	
	public StringBuffer readStringBuffer2(){
		return sb2;
	}
	
	public StringBuffer readStringBuffer3(){
		return sb3;
	}
	
	public StringBuffer readStringBuffer4(){
		return sb4;
	}

}
