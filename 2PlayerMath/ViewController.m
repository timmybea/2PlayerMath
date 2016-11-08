//
//  ViewController.m
//  2PlayerMath
//
//  Created by Tim Beals on 2016-11-07.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import "ViewController.h"
#import "EquationGenerator.h"
#import "GameController.h"
#import "Player.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *p1LivesLabel;
@property (weak, nonatomic) IBOutlet UILabel *p2LivesLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *ansLabel;
@property (nonatomic) EquationGenerator *equationGenerator;
@property (nonatomic) GameController *gameController;
@property (nonatomic) NSString *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.questionLabel.text = [[NSMutableString alloc] init];
    self.equationGenerator = [[EquationGenerator alloc] init];
    self.gameController = [[GameController alloc] init];
    [self.gameController changeActivePlayer];
    self.player = self.gameController.activePlayer.name;
    
    NSString *question = [self.equationGenerator generateQuestion];
    self.questionLabel.text = [NSString stringWithFormat:@"%@: %@", self.player, question];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)enterButtonTouched:(UIButton *)sender {
    
    if([self.equationGenerator.answer isEqualToString:self.ansLabel.text])
    {
        self.messageLabel.textColor = [UIColor greenColor];
        self.messageLabel.text = @"CORRECT!";
    }
    else
    {
        self.gameController.activePlayer.lives -= 1;
        if([self.player isEqualToString:@"Player 1"])
        {
            self.p1LivesLabel.text = [NSString stringWithFormat:@"%@: %ld lives", self.player, [self.gameController player1Lives]];
        }
        else
        {
            self.p2LivesLabel.text = [NSString stringWithFormat:@"%@: %ld lives", self.player, [self.gameController player2Lives]];
        }
        
        if(self.gameController.activePlayer.lives == 0)
        {
            self.messageLabel.textColor = [UIColor redColor];
            self.messageLabel.text = @"Incorrect";
            self.player = [self.gameController changeActivePlayer];

            UIAlertController * alert =   [UIAlertController
                                          alertControllerWithTitle:@"GAME OVER!"
                                           message:[NSString stringWithFormat:@"%@ WINS!", self.player]
                                          preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* replay = [UIAlertAction
                                 actionWithTitle:@"REPLAY"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     self.gameController = [[GameController alloc] init];
                                     [self.gameController changeActivePlayer];
                                     self.messageLabel.text = @"";
                                     self.p1LivesLabel.text = [NSString stringWithFormat:@"Player1: %ld lives", [self.gameController player1Lives]];
                                     self.p2LivesLabel.text = [NSString stringWithFormat:@"Player2: %ld lives", [self.gameController player2Lives]];
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                 }];
            [alert addAction:replay];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else
        {
            self.messageLabel.textColor = [UIColor redColor];
            self.messageLabel.text = @"Incorrect";
        }
        
    }

    self.player = [self.gameController changeActivePlayer];
    NSString *question = [self.equationGenerator generateQuestion];
        self.questionLabel.text = [NSString stringWithFormat:@"%@: %@", self.player, question];
    self.ansLabel.text = @"";
}

- (IBAction)but1:(id)sender
{
    self.ansLabel.text = [self.ansLabel.text stringByAppendingString:@"1"];
}

- (IBAction)but2:(id)sender
{
    self.ansLabel.text = [self.ansLabel.text stringByAppendingString:@"2"];}

- (IBAction)but3:(id)sender
{
    self.ansLabel.text = [self.ansLabel.text stringByAppendingString:@"3"];
}

- (IBAction)but4:(id)sender
{
    self.ansLabel.text = [self.ansLabel.text stringByAppendingString:@"4"];
}

- (IBAction)but5:(id)sender
{
    self.ansLabel.text = [self.ansLabel.text stringByAppendingString:@"5"];}

- (IBAction)but6:(id)sender
{
    self.ansLabel.text = [self.ansLabel.text stringByAppendingString:@"6"];
}

- (IBAction)but7:(id)sender
{
    self.ansLabel.text = [self.ansLabel.text stringByAppendingString:@"7"];
}

- (IBAction)but8:(id)sender
{
    self.ansLabel.text = [self.ansLabel.text stringByAppendingString:@"8"];
}

- (IBAction)but9:(id)sender
{
    self.ansLabel.text = [self.ansLabel.text stringByAppendingString:@"9"];
}

- (IBAction)but0:(id)sender
{
    self.ansLabel.text = [self.ansLabel.text stringByAppendingString:@"0"];
}

- (IBAction)butDelete:(id)sender
{
    NSString *currentLabelText = self.ansLabel.text;
    self.ansLabel.text = [currentLabelText substringToIndex:currentLabelText.length - (currentLabelText.length > 0)];
    //boolean to test if string is more than 0 characters to prevent a crash.
}

@end
