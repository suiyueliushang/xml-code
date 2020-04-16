package com.example.saxproject;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import java.io.InputStream;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

public class MainActivity extends AppCompatActivity {
    private Button button;
    private TextView textview_1;
    private TextView textview_2;
    private EditText editText;
    private String conditions;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        button=findViewById(R.id.button);
        textview_1=findViewById(R.id.text_1);
        textview_2=findViewById(R.id.text_2);
        editText=findViewById(R.id.edit_text);
        TextWatcher afterTextChangedListener = new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
                // ignore
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                // ignore
            }

            @Override
            public void afterTextChanged(Editable s) {
            }
        };
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                conditions=editText.getText().toString();
                textview_2.setText(conditions);
                try{
                    SAXParserFactory factory=SAXParserFactory.newInstance();
                    SAXParser parser=factory.newSAXParser();
                    System.out.println(conditions);
                    SaxHandler handler=new SaxHandler(conditions);
                    InputStream is = getAssets().open("animation_3.xml");
                    parser.parse(is,handler);
                    StringBuilder answer=handler.getAnswer();
                    textview_2.setText(answer);
                }
                catch (Exception e)
                {e.printStackTrace();}
            }
        });
    }
}
