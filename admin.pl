use LWP::UserAgent;
use Getopt::Long;
use Win32::Console::ANSI;
use Term::ANSIColor;

sub ascii {

	print colored q{
  __________________
< Admin Page finder >
  ------------------
         \   ^__^ 
          \  (oo)\_______
             (__)\       )\/\
                 ||----w |
                 ||     ||
 	
	},'bold cyan';
}

my ($optList, $optHelp);
	GetOptions('list|w=s' => \$optList,
	'help|h' => \$optHelp
	);
	
	if($optHelp){
		system "cls";
		&ascii;
		
		print colored q{
		--=[ Usage: 
		--=[ 01: --list (list);
		--=[ 02: --help (show help);
		},'bold blue';
		exit;
	}

system "cls";
&ascii;
print "\n\n--=[ Usage: perl admin.pl --list (list)\n";
print "--=[ Help: perl admin.pl --help\n\n";
sleep "1";

open($list,'<',$optList);
@list = <$list>;

foreach $webs(@list){

	@paths = ('admin/','adm/','wp-admin/','administrators/','administrivia/','adminLogin.asp','admin-login.asp','adminLogin.cfm','admin-login.cfm','adminLogin.html','admin-login.html','adminLogin.php','admin-login.php','adminLogin/','adminpanel.asp','adminpanel.cfm','adminpanel.html','adminpanel.php','adminpro/','admins.asp','admins.html','admins.php','admins/','AdminTools/','admloginuser.asp','admloginuser.cfm','admloginuser.php','affiliate.asp','affiliate.cfm','affiliate.php','autologin/','banneradmin/','bbadmin/','bb-admin/','bb-admin/admin.asp','bb-admin/admin.cfm','bb-admin/admin.html','bb-admin/admin.php','bb-admin/index.asp','bb-admin/index.cfm','bb-admin/index.html','bb-admin/index.php','bb-admin/login.asp','bb-admin/login.cfm','bb-admin/login.html','bb-admin/login.php','bigadmin/','blogindex/','cadmins/','ccp14admin/','cmsadmin/','controlpanel.asp','controlpanel.cfm','controlpanel.html','controlpanel.php','controlpanel/','cp.asp','cp.cfm','cp.html','cp.php','cPanel/','cpanel_file/','customer_login/','database_administration/','directadmin/','dir-login/','ezsqliteadmin/','fileadmin.asp','fileadmin.html','fileadmin.php','fileadmin/','formslogin/','globes_admin/','home.asp','home.cfm','home.html','home.php','hpwebjetadmin/','Indy_admin/','instadmin/','irc-macadmin/','LiveUser_Admin/','login.asp','login.cfm','login.html','login.php','login_db/','login1/','loginflat/','login-redirect/','login-us/','logo_sysadmin/','Lotus_Domino_Admin/','macadmin/','manuallogin/','memberadmin.asp','memberadmin.cfm','memberadmin.php','memberadmin/','members/','memlogin/','meta_login/','modelsearch/admin.asp','modelsearch/admin.cfm','modelsearch/admin.html','modelsearch/admin.php','modelsearch/index.asp','modelsearch/index.cfm','modelsearch/index.html','modelsearch/index.php','modelsearch/login.asp','modelsearch/login.cfm','modelsearch/login.html','modelsearch/login.php','moderator.asp','moderator.cfm','moderator.html','moderator.php','moderator/','moderator/admin.asp','moderator/admin.cfm','moderator/admin.html','moderator/admin.php','moderator/login.asp','moderator/login.cfm','moderator/login.html','moderator/login.php','myadmin/','navSiteAdmin/','newsadmin/','nsw/admin/login.php','openvpnadmin/','pages/admin/admin-login.asp','pages/admin/admin-login.cfm','pages/admin/admin-login.html','pages/admin/admin-login.php','panel/','panel-administracion/','panel-administracion/admin.asp','panel-administracion/admin.cfm','panel-administracion/admin.html','panel-administracion/admin.php','panel-administracion/index.asp','panel-administracion/index.cfm','panel-administracion/index.html','panel-administracion/index.php','panel-administracion/login.asp','panel-administracion/login.cfm','panel-administracion/login.html','panel-administracion/login.php','pgadmin/','phpldapadmin/','phpmyadmin/','phppgadmin/','phpSQLiteAdmin/','platz_login/','power_user/','project-admins/','pureadmin/','radmind/','radmind-1/','rcjakar/admin/login.php','rcLogin/','Server.asp','Server.html','Server.php','server/','server_admin_small/','ServerAdministrator/','showlogin/','simpleLogin/','siteadmin/index.asp','siteadmin/index.cfm','siteadmin/index.php','siteadmin/login.asp','siteadmin/login.cfm','siteadmin/login.html','siteadmin/login.php','smblogin/','sql-admin/','ss_vms_admin_sm/','sshadmin/','staradmin/','sub-login/','Super-Admin/','support_login/','sysadmin.asp','sysadmin.html','sysadmin.php','sysadmin/','sys-admin/','SysAdmin2/','sysadmins/','system_administration/','system-administration/','typo3/','ur-admin.asp','ur-admin.html','ur-admin.php','ur-admin/','user.asp','user.html','user.php','useradmin/','UserLogin/','utility_login/','vadmind/','vmailadmin/','webadmin.asp','webadmin.cfm','webadmin.html','webadmin.php','WebAdmin/','webadmin/admin.asp','webadmin/admin.cfm','webadmin/admin.html','webadmin/admin.php','webadmin/index.asp','webadmin/index.cfm','webadmin/index.html','webadmin/index.php','webadmin/login.asp','webadmin/login.cfm','webadmin/login.html','webadmin/login.php','wizmysqladmin/','wp-admin/','wp-login.php','wp-login/','xlogin/','yonetici.asp','yonetici.html','yonetici.php','yonetim.asp','yonetim.html','yonetim.php','panel/?a=cp');

	foreach $path(@paths){
		my $webspath = $webs.$path;
		my $ua = LWP::UserAgent->new;
		my $request = $ua->get($webspath);
		my $response = $request->code;
		
		if ($response == 200){
			open(sv,'>>ok.txt');
			print sv "
			<!-- Code: Arthur (kosu) -->
			<!-- Team: Helipa Crew -->\n\n
			$webs/$path\n";
			close(sv);
			system "start ok.txt";
			exit;
		}
	}
}