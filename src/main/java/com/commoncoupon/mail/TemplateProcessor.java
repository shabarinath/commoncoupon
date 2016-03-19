package com.commoncoupon.mail;

import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;

public class TemplateProcessor {

    static private Log log = LogFactory.getLog(TemplateProcessor.class);
    
    private Configuration cfg = null;
    private String templateDir = null;

    public static final short EMAIL_TEMPLATE = 0;
    public static final short MESSAGE_TEMPLATE = 1;
    public static final short IM_TEMPLATE = 2;
    public static final short SMS_TEMPLATE = 3;
    
    public TemplateProcessor() throws IOException {
    	this(EMAIL_TEMPLATE);
    }
    
    public TemplateProcessor(short templateOption) throws IOException {
    	if(templateOption == EMAIL_TEMPLATE) {
    		this.templateDir = this.getTemplateDir();
    	} else {
    		throw new IOException("Invalid Option");
    	}
        initConfiguration();
    } 

    
     /** Get processed template as String*/
     
    public String process(String templateName, Map<String, Object> data) throws TemplateProcessException {
        try {
            Template temp = cfg.getTemplate(templateName);
            StringWriter out = new StringWriter();
            temp.process(data, out);
            String text = out.toString();
            out.flush();
            return text;
        } catch (Exception e) {
            log.error("Failed to process template :" + e.getMessage(), e);
            throw new TemplateProcessException(e.getMessage());
        }
    }

    
     /** Outputs the processed template using the given writer(system,StringWriter etc)*/
     
    public void process(String templateName, Map<String, Object> data, Writer out) throws TemplateProcessException {
        try {
            Template temp = cfg.getTemplate(templateName);
            temp.process(data, out);
            out.flush();
        } catch (Exception e) {
            log.error("Failed to process template :" + e.getMessage(), e);
            throw new TemplateProcessException(e.getMessage());
        }
    }

    private String getTemplateDir() {
        return getClass().getClassLoader().getResource("template/mail").getFile();
    }
    private void initConfiguration() throws IOException {
        cfg = new Configuration();
        cfg.setDirectoryForTemplateLoading(new File(this.templateDir));
        cfg.setObjectWrapper(new DefaultObjectWrapper());
    }

}