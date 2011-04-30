// ex
// String command[] = new String[2];
// command[0] = "ls";
// command[1] = "-l";
// getOutputFromCommandArray(command);
import java.io.BufferedReader;
import java.io.InputStreamReader;

public BufferedReader getOutputFromCommandArray(String command[])
{
    BufferedReader buffer = null;

    try
    {
        Process p = Runtime.getRuntime().exec(command);
        buffer = new BufferedReader(new InputStreamReader(p.getInputStream(),
            "UTF8"));
        

    }
    catch(Exception ex)
    {

    }
    return buffer;

}

// ex
// String command = "ls -l";
// getOutputFromCommandString(command);
import java.io.BufferedReader;
import java.io.InputStreamReader;

public BufferedReader getOutputFromCommandString(String command)
{
    BufferedReader buffer = null;

    try
    {
        Process p = Runtime.getRuntime().exec(command);
        buffer = new BufferedReader(new InputStreamReader(p.getInputStream(),
                "UTF8"));


    }
    catch(Exception ex)
    {

    }
    return buffer;

}




