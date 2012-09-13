package com.cyanogenmod.settings.device;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import android.util.Log;

public class Utils {
    private static final String TAG = "StingrayParts_Utils";

    /**
     * Write a string value to the specified file.
     * @param filename      The filename
     * @param value         The value
     */
    public static void writeValue(String filename, String value) {
        try {
            FileOutputStream fos = new FileOutputStream(new File(filename));
            fos.write(value.getBytes());
            fos.flush();
            fos.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Write a string value to the specified file.
     * @param filename      The filename
     * @param value         The value
     */
    public static void writeValue(String filename, Boolean value) {
        try {
            String sEnvia;
            FileOutputStream fos = new FileOutputStream(new File(filename));
            if(value)
                sEnvia = "1";
            else
                sEnvia = "0";
            fos.write(sEnvia.getBytes());
            fos.flush();
            fos.getFD().sync();
            fos.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Check if the specified file exists.
     * @param filename      The filename
     * @return              Whether the file exists or not
     */
    public static boolean fileExists(String filename) {
        return new File(filename).exists();
    }

    /**
     * Read value from sysfs interface.
     * @param filename      The filename
     * @return              The value
     */
    public static String readSysfsLine(String filename) {
        BufferedReader brBuffer;
        String sLine = null;

        try {
            brBuffer = new BufferedReader(new FileReader(filename), 512);
            try {
                sLine = brBuffer.readLine();
            } finally {
                brBuffer.close();
            }
        } catch (Exception e) {
            Log.e(TAG, "I/O Exception when reading /sys/ file", e);
        }
        return sLine;
    }
}
