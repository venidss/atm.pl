#!/usr/bin/perl

my %accounts = (
    1234 => {
        balance => 1000,
        pin => 1111
    },
    5678 => {
        balance => 2000,
        pin => 2222
    },
    9101 => {
        balance => 1500,
        pin => 3333
    },
    1122 => {
        balance => 3000,
        pin => 4444
    },
    3344 => {
        balance => 2500,
        pin => 5555
    }
);

while (1) {
    print "\n1. Check Balance\n";
    print "2. Withdraw\n";
    print "3. Deposit\n";
    print "4. Add another account\n";
    print "5. Exit\n";
    print "Enter your choice: ";
    my $choice = <>;
    chomp($choice);
    
    if ($choice == 1) {
        print "Enter account number: ";
        my $account_num = <>;
        chomp($account_num);
        if (exists $accounts{$account_num}) {
            print "Enter PIN: ";
            my $pin = <>;
            chomp($pin);
            if ($pin == $accounts{$account_num}->{pin}) {
                print "Balance for account $account_num: $accounts{$account_num}->{balance}\n";
            } else {
                print "Invalid PIN\n";
            }
        } else {
            print "Account not found\n";
        }
    } elsif ($choice == 2) {
        print "Enter account number: ";
        my $account_num = <>;
        chomp($account_num);
        if (exists $accounts{$account_num}) {
            print "Enter PIN: ";
            my $pin = <>;
            chomp($pin);
            if ($pin == $accounts{$account_num}->{pin}) {
                print "Enter amount to withdraw: ";
                my $amount = <>;
                chomp($amount);
                if ($accounts{$account_num}->{balance} >= $amount) {
                    $accounts{$account_num}->{balance} -= $amount;
                    print "Withdrawn $amount from account $account_num\n";
                } else {
                    print "Insufficient balance\n";
                }
            } else {
                print "Invalid PIN\n";
            }
        } else {
            print "Account not found\n";
        }
    } elsif ($choice == 3) {
        print "Enter account number: ";
        my $account_num = <>;
        chomp($account_num);
        if (exists $accounts{$account_num}) {
            print "Enter PIN: ";
            my $pin = <>;
            chomp($pin);
            if ($pin == $accounts{$account_num}->{pin}) {
                print "Enter amount to deposit: ";
                my $amount = <>;
                chomp($amount);
                $accounts{$account_num}->{balance} += $amount;
                print "Deposited $amount to account $account_num\n";
            } else {
                print "Invalid PIN\n";
            }
        } else {
            print "Account not found\n";
        }
    } elsif ($choice == 4) {
        print "Enter new account number: ";
        my $new_account_num = <>;
        chomp($new_account_num);
        print "Enter initial balance: ";
        my $initial_balance = <>;
        chomp($initial_balance);
        print "Enter PIN: ";
        my $pin = <>;
        chomp($pin);
        $accounts{$new_account_num} = {
            balance => $initial_balance,
            pin => $pin
        };
        print "New account added: $new_account_num\n";
    } elsif ($choice == 5) {
        last;
    } else {
        print "Invalid choice\n";
    }
}

print "Exiting...\n";
