package com.rn554;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.uimanager.ViewManager;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Nullable;

public class NativeUnimoduleProxy extends ReactContextBaseJavaModule {

    private final static String NAME = "NativeUnimoduleProxy";
    private final static String VIEW_MANAGERS_NAMES_KEY = "viewManagersNames";
    private final static String MODULES_CONSTANTS_KEY = "modulesConstants";
    private final static String EXPORTED_METHODS_KEY = "exportedMethods";

    private final static String METHOD_INFO_KEY = "key";
    private final static String METHOD_INFO_NAME = "name";
    private final static String METHOD_INFO_ARGUMENTS_COUNT = "argumentsCount";

    private final static String UNEXPECTED_ERROR = "E_UNEXPECTED_ERROR";
    private final static String UNDEFINED_METHOD_ERROR = "E_UNDEFINED_METHOD";
    private final static String ARGS_TYPES_MISMATCH_ERROR = "E_ARGS_TYPES_MISMATCH";



    public NativeUnimoduleProxy(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return NAME;
    }

    @Nullable
    @Override
    public Map<String, Object> getConstants() {

        Map<String, Object> modulesConstants = new HashMap<>(0);
        Map<String, Object> exportedMethodsMap = new HashMap<>();
        exportedMethodsMap.put("ExponentDeviceMotion",new ArrayList<>());

        List<String> viewManagersNames = new ArrayList<>(0);



        Map<String, Object> constants = new HashMap<>(2);
        constants.put(MODULES_CONSTANTS_KEY, modulesConstants);
        constants.put(EXPORTED_METHODS_KEY, exportedMethodsMap);
        constants.put(VIEW_MANAGERS_NAMES_KEY, viewManagersNames);
        return constants;
    }
}
