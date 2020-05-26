class hex{
 public static void main(String[] Bett0){
	String msj=new String();
	
	for(int j=0; j<EHacking.length; j++){
		msj=msj+EHacking[j]+" ";
	}
	
	System.out.println("[*] Plain: "+msj);
	
	String hexa=new String();
	hexa="0x";
	
	try{
		for(int i=0; i<msj.length()-2; i++){
			int num=(int)msj.charAt(i);
			String cad=Integer.toString(num,16);
			hexa=hexa+cad;
		}
		System.out.println("[*] Hexa:  "+hexa+"\n");
	}
	catch(Exception err){
		System.out.print("Error: No controlado jaja");
	}
		System.exit(0);
 }
}

