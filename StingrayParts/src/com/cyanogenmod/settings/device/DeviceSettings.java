package com.cyanogenmod.settings.device;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;
import android.preference.PreferenceScreen;
import android.util.Log;

public class DeviceSettings extends PreferenceActivity  {
    public static final String KEY_CHARGINGLED = "charging_led";
    private static final String CHARGINGLED_FILE = "/sys/class/gpio/gpio168/value";
    private static final String PREF_ENABLED = "0";
    private static final String PREF_DISABLED = "1";
    private static final String TAG = "StingrayParts_General";

    private CheckBoxPreference mChargingLED;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        addPreferencesFromResource(R.xml.preferences);
        mChargingLED = (CheckBoxPreference) findPreference(KEY_CHARGINGLED);
        mChargingLED.setEnabled(Utils.fileExists(CHARGINGLED_FILE));
    }

    @Override
    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        String boxValue;
        String key = preference.getKey();
        Log.w(TAG, "key: " + key);
        if (key.equals(KEY_CHARGINGLED)) {
            final CheckBoxPreference chkPref = (CheckBoxPreference) preference;
            boxValue = chkPref.isChecked() ? PREF_ENABLED : PREF_DISABLED;
            Utils.writeValue(CHARGINGLED_FILE, boxValue);
        }
        return true;
    }

    public static void restore(Context context) {
        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        if (Utils.fileExists(CHARGINGLED_FILE)) {
            String pref = sharedPrefs.getBoolean(KEY_CHARGINGLED, false) ? PREF_ENABLED : PREF_DISABLED;
            Utils.writeValue(CHARGINGLED_FILE, pref);
        }
    }
}
