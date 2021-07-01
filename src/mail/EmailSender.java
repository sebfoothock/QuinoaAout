
package mail;

import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailSender {

    public static boolean run(String toAddress, String subject, String content) {

        String fromAddress = "@gmail.com";
        String contentType = "text/plain";
        String smtpHost = "smtp.gmail.com";
        int smtpPort = 587;
        String username = "@gmail.com";
        String password = "";
        try
        {
            Properties props = System.getProperties();
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.auth", "true");
            Session session = Session.getDefaultInstance(props);
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromAddress));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(toAddress, false));
            message.setSubject(subject);
            message.setContent(content, contentType);
            message.setSentDate(new Date());
            Transport transport = session.getTransport("smtp");
            transport.connect(smtpHost, smtpPort, username, password);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            return true;
        } catch (MessagingException messagingException)
        {
            System.out.print(messagingException);
            return false;

        } catch (Exception e)
        {
            System.out.print(e);
            return false;
        }
    }
}
