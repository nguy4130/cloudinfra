from sendgrid import SendGridAPIClient
from sendgrid.helpers.mail import Mail
import os

def send_email(request):
    """
    Cloud Function to send an email using SendGrid.

    Args:
        request: The request object.  It can contain data passed to the function.
            Look for 'to', 'from', 'subject', and 'content' keys for email parameters.
            Defaults are used if these keys are not present.
    """

    try:
        # Extract email parameters from the request, using defaults if not provided
        to_email = request.get_json().get('to', "default_recipient@example.com")
        from_email = request.get_json().get('from', "default_sender@example.com")  # Should match a verified sender in SendGrid
        subject = request.get_json().get('subject', "Default Subject")
        content = request.get_json().get('content', "Default email content.")
        print(f'json payload: {request.get_json()}')
        # Compose the email message
        message = Mail(
            from_email=from_email,
            to_emails=to_email,
            subject=subject,
            html_content=content)

        # Send the email using the SendGrid API client
        try:
            sendgrid_client = SendGridAPIClient(os.environ.get('SENDGRID_API_KEY'))
            response = sendgrid_client.send(message)
            print(f'response: {response}')
            # Log the SendGrid response for debugging
            print(f"SendGrid response status_code: {response.status_code}")
            print(f"SendGrid response body: {response.body}")
            print(f"SendGrid response headers: {response.headers}")

            return f"Email sent successfully! Status code: {response.status_code}", 200  # Return a success message

        except Exception as e:
            print(f"Error sending email: {e}")
            return f"Error sending email: {e}", 500 # Return an error message with a 500 status code

    except Exception as e: # Catch any other errors during function execution
        print(f"An unexpected error occurred: {e}")
        return "An unexpected error occurred", 500  # Return a generic error response



