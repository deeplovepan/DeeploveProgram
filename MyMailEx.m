//
//  MyMailEx.m
//  DeeploveProgram
//
//  Created by Peter Pan on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MyMailEx.h"

@implementation MyMailEx


    send email
 
    1. add MessageUI framework
    2. #import <MessageUI/MessageUI.h>
    3. implement MFMailComposeViewControllerDelegate
    4. send mail function
 
    -(void)sendMail
    {
        MFMailComposeViewController *mailController = 
        [[MFMailComposeViewController alloc] init];
        
        if(mailController)
        {
            mailController.delegate = self;
            
            NSString *content = @"停電了，你那裡還好嗎?就讓我的手機簡訊，"
            "給你光亮，給你溫暖。";
            [mailController setMessageBody:content isHTML:NO];
            [mailController setSubject:@"停電"];
            [mailController setToRecipients:[NSArray arrayWithObjects:
                                             @"deeplovepan@gmail.com",
                                             @"crazyloveiphone@gmail.com",
                                             nil]];
            
            NSString *path = [[NSBundle mainBundle]
                              pathForResource:@"eatRabbit" ofType:@"tiff" ];
            NSData *data = [NSData dataWithContentsOfFile:path];
            [mailController addAttachmentData:data mimeType:@"image/tiff"
                                     fileName:@"eatRabbit.tiff"];
            
            [self presentModalViewController:mailController animated:YES];
        }

    }
     

 
    - (void)mailComposeController:(MFMailComposeViewController *)controller 
        didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error 
    {
        if( result == MFMailComposeResultSent)
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"sent successfully" message:nil delegate:self cancelButtonTitle:@"Ok"
                otherButtonTitles:nil];
            [alertView show];
        }
        else if(result == MFMailComposeResultFailed)
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"sent failed" 
                    message:nil delegate:self cancelButtonTitle:@"Ok"
                    otherButtonTitles:nil];
            [alertView show];
        }
        else if(result == MFMailComposeResultCancelled ||
                result == MFMailComposeResultSaved)
        {
 
        }
 
        [self dismissModalViewControllerAnimated:YES];
    }

 


@end
