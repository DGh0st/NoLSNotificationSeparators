@interface SBLockScreenNotificationTableView : UITableView
@end

%hook SBLockScreenNotificationListView
-(id)initWithFrame:(CGRect)arg1 {
	id result = %orig(arg1);
	UIView *containerView = (UIView *)MSHookIvar<UIView *>(self, "_containerView");
	((UIView *)[containerView subviews][1]).hidden = YES;
	((UIView *)[containerView subviews][2]).hidden = YES;
	((UITableView *)MSHookIvar<SBLockScreenNotificationTableView *>(self, "_tableView")).separatorStyle = UITableViewCellSeparatorStyleNone;
	return result;
}
%end

%hook SBDashBoardClippingLine
-(CGFloat)lineAlpha {
	return 0.0;
}

-(void)setLineAlpha:(CGFloat)arg1 {
	%orig(0.0);
}
%end