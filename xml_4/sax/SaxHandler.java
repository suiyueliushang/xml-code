package com.example.saxproject;


import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;


public class SaxHandler extends DefaultHandler {
    private StringBuilder answer = new StringBuilder("");
    private StringBuilder animation = new StringBuilder("");
    private String last = null;
    private String currentTag = null;
    private boolean isAdd = true;
    private ArrayList<String> elements = new ArrayList<String>();
    private ArrayList<String> elements_condition = new ArrayList<String>();
    private String element_ops = "";
    private ArrayList<String> attrs = new ArrayList<String>();
    private ArrayList<String> attrs_condition = new ArrayList<String>();
    private String attrs_ops = "";
    private boolean isAnd = true;
    private String condition;
    private HashMap<String, Boolean> conditions=new HashMap<String,Boolean>();

    public void handleCondition() {
        String[] temp = condition.split(" ");
        for (int i = 0; i < temp.length; i++) {
            if (temp[i].charAt(0) == '@') {
                String a = "";
                String b = "";
                boolean judge = true;
                for (int j = 1; j < temp[i].length(); j++) {
                    if (temp[i].charAt(j) != '<' && temp[i].charAt(j) != '>' && temp[i].charAt(j) != '=') {
                        if (judge) {
                            a += temp[i].charAt(j);
                        } else {
                            b += temp[i].charAt(j);
                        }
                    } else {
                        attrs_ops += temp[i].charAt(j);
                        judge = false;
                    }
                }
                attrs.add(a);
                attrs_condition.add(b);
            } else if (temp[i].equals("&&")) {
                isAnd = true;
            } else if (temp[i].equals("||")) {
                isAnd = false;
            } else {
                String a = "";
                String b = "";
                boolean judge = true;
                for (int j = 0; j < temp[i].length(); j++) {
                    if (temp[i].charAt(j) != '<' && temp[i].charAt(j) != '>' && temp[i].charAt(j) != '=') {
                        if (judge) {
                            a += temp[i].charAt(j);
                        } else {
                            b += temp[i].charAt(j);
                        }
                    } else {
                        element_ops += temp[i].charAt(j);
                        judge = false;
                    }
                }
                elements.add(a);
                elements_condition.add(b);
            }
        }
    }

    public StringBuilder getAnswer() {
        return answer;
    }

    @Override
    public void characters(char[] arg0, int arg1, int arg2) throws SAXException {
        //System.out.print(new String(arg0, arg1, arg2));
        last = new String(arg0, arg1, arg2);
        if(last!=null)
            animation.append(last);
        if (currentTag != null) {
            for(int i=0;i<elements.size();i++)
            {
                if(elements.get(i).equals(currentTag))
                {
                    if(currentTag.equals("startTime"))
                    {
                        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
                        try {
                            Date d1 = sdf2.parse(last);
                            Date d2= sdf2.parse(elements_condition.get(i));
                            if(element_ops.charAt(i)=='>')
                            {
                                if(d1.compareTo(d2)==1)
                                {
                                    conditions.put(currentTag,true);
                                }
                                else
                                {
                                    conditions.put(currentTag,false);
                                }
                            }
                            if(element_ops.charAt(i)=='=')
                            {
                                if(d1.compareTo(d2)==0)
                                {
                                    conditions.put(currentTag,true);
                                }
                                else
                                {
                                    conditions.put(currentTag,false);
                                }
                            }
                            if(element_ops.charAt(i)=='<')
                            {
                                if(d1.compareTo(d2)==-1)
                                {
                                    conditions.put(currentTag,true);
                                }
                                else
                                {
                                    conditions.put(currentTag,false);
                                }
                            }
                        }catch (Exception e)
                        {e.printStackTrace();}
                    }else if (currentTag.equals("endTime"))
                    {
                        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
                        try {
                            Date d1 = sdf2.parse(last);
                            Date d2= sdf2.parse(elements_condition.get(i));
                            if(element_ops.charAt(i)=='>')
                            {
                                if(d1.compareTo(d2)==1)
                                {
                                    conditions.put(currentTag,true);
                                }
                                else
                                {
                                    conditions.put(currentTag,false);
                                }
                            }
                            if(element_ops.charAt(i)=='=')
                            {
                                if(d1.compareTo(d2)==0)
                                {
                                    conditions.put(currentTag,true);
                                }
                                else
                                {
                                    conditions.put(currentTag,false);
                                }
                            }
                            if(element_ops.charAt(i)=='<')
                            {
                                if(d1.compareTo(d2)==-1)
                                {
                                    conditions.put(currentTag,true);
                                }
                                else
                                {
                                    conditions.put(currentTag,false);
                                }
                            }
                        }catch (Exception e)
                        {e.printStackTrace();}
                    }
                    else
                    {
                        if(elements_condition.get(i).equals(last))
                        {
                            conditions.put(currentTag,true);
                        }
                        else
                            conditions.put(currentTag,false);
                    }
                }
            }
        }
        super.characters(arg0, arg1, arg2);
    }

    @Override
    public void endDocument() throws SAXException {
        super.endDocument();
    }

    @Override
    public void endElement(String arg0, String arg1, String arg2)
            throws SAXException {
        if ("animation-list".equals(arg2)) {
            answer.append(last);
            answer.append("</");
            //System.out.print(arg2);
            answer.append(arg2);
            //System.out.print(">");
            answer.append(">");
            //System.out.println(answer);
        } else {
            animation.append("</");
            //System.out.print(arg2);
            animation.append(arg2);
            //System.out.print(">");
            animation.append(">");
            if ("animation".equals(arg2)) {
                //System.out.println(animation);
                if(isAnd)
                {
                    for (String key : conditions.keySet()) {
                        if(!conditions.get(key))
                            isAdd=false;
                    }
                }
                else
                {
                    boolean isTrue=false;
                    for (String key : conditions.keySet()) {
                        if(conditions.get(key))
                        {
                            isTrue=true;
                        }
                    }
                    isAdd=isTrue;
                }
                if(isAdd)
                {
                    answer.append(animation);
                }
                animation=new StringBuilder("");
                if(!conditions.isEmpty())
                    conditions.clear();
                isAnd = true;
                isAdd=true;
            }
        }
        currentTag = null;
        super.endElement(arg0, arg1, arg2);
    }

    @Override
    public void startDocument() throws SAXException {
        //System.out.println("开始解析");
        String s = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
        //System.out.println(s);
        super.startDocument();
    }

    @Override
    public void startElement(String arg0, String arg1, String arg2,
                             Attributes arg3) throws SAXException {

        //System.out.print("<");
        if ("animation-list".equals(arg2)) {
            answer.append("<");
            //System.out.print(arg2);
            answer.append(arg2);

            if (arg3 != null) {
                for (int i = 0; i < arg3.getLength(); i++) {
                    //System.out.print(" " + arg3.getQName(i) + "=\"" + arg3.getValue(i) + "\"");
                    answer.append(" " + arg3.getQName(i) + "=\"" + arg3.getValue(i) + "\"");
                }
            }
            //System.out.print(">");
            answer.append(">");
            //System.out.println("here");
            //System.out.println(answer);
        } else {
            animation.append("<");
            //System.out.print(arg2);
            animation.append(arg2);
            if (arg3 != null) {
                for (int i = 0; i < arg3.getLength(); i++) {
                    //System.out.print(" " + arg3.getQName(i) + "=\"" + arg3.getValue(i) + "\"");
                    animation.append(" " + arg3.getQName(i) + "=\"" + arg3.getValue(i) + "\"");
                }
                if (!attrs.isEmpty()) {
                    for (int i = 0; i < attrs.size(); i++) {
                        if(attrs.get(i).equals(arg3.getQName(0)))
                        {
                            if(attrs_condition.get(i).equals(arg3.getValue(0)))
                            {
                                conditions.put(arg3.getQName(0),true);
                            }else
                                conditions.put(arg3.getQName(0),false);
                        }
                    }
                }
            }
            //System.out.print(">");
            animation.append(">");
        }
        currentTag = arg2;
        super.startElement(arg0, arg1, arg2, arg3);
    }

    public SaxHandler(String condition) {
        this.condition = condition;
        handleCondition();
    }
}

