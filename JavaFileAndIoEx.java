// read every line from buffer reader
BufferedReader buffer;
String line;
while( (line= buffer.readLine()) != null)
{
    
}


// read from file
String path = "/tmp/test.txt";
try 
{
    FileInputStream fileInputStream = new FileInputStream(path);
    DataInputStream dataInputStream = new DataInputStream(fileInputStream);
    BufferedReader bufferedInputStream = new BufferedReader(new InputStreamReader(dataInputStream));
    String strLine;
    while ((strLine = bufferedInputStream.readLine()) != null)   
    {

    }
    dataInputStream.close();
}
catch(Exception ex)
{

}