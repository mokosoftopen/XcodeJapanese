//
//  XcodeJapanese.m
//  XcodeJapanese
//
//  Created by 孝岡秀俊 on 2014/01/29.
//  Copyright (c) 2014年 mokosoft. All rights reserved.
//

#import "XcodeJapanese.h"

static XcodeJapanese* sharedPlugin=nil;

@interface XcodeJapanese()
@property (nonatomic, strong) NSBundle *bundle;
@property (nonatomic, strong) NSBundle *bundl2e;
@end

@implementation XcodeJapanese

+(void)pluginDidLoad:(NSBundle *)plugin {
    
    static dispatch_once_t onceToken;
    
    NSString *currentApplicationName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
    if (sharedPlugin==nil && [currentApplicationName isEqual:@"Xcode"]) {
        dispatch_once(&onceToken, ^{
            sharedPlugin=[[self alloc] initWithBundle:plugin];
        });
    }
    
}

- (id)initWithBundle:(NSBundle *)plugin {
    self = [super init];
    if (self) {
        self.bundle = plugin;
        
        boAddMenu = NO;
        
        [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(change_menu) userInfo:nil repeats:NO];
        
        
        NSNotificationCenter *nCenter =[NSNotificationCenter defaultCenter];
        [nCenter addObserver:self
                    selector:@selector(menuChange:)                        name:@"NSMenuDidChangeItemNotification" //メニューが変更されたら
                      object:nil];
        
        
    }
    return self;
}

-(void)menuChange:(NSNotification *)notification
{
    //[self change_menu];
}

-(void)change_menu
{
    
    NSMenuItem *topmenu;
    NSMenuItem *menu;
    NSMenuItem *menu2;
    
    topmenu = [[NSApp mainMenu] itemWithTitle:@"Xcode"];
    if ( topmenu ) {
        
        menu = [[topmenu submenu] itemWithTitle:@"About Xcode"];
        if (menu) [menu setTitle:@"Xcodeについて"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Preferences…"];
        if (menu) [menu setTitle:@"環境設定"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Behaviors"];
        if (menu) [menu setTitle:@"動作(ビヘイビア)設定"];
        
        menu2 = [[menu submenu] itemAtIndex:[[menu submenu] numberOfItems]-1];
        if (menu2) [menu2 setTitle:@"動作設定を変更する"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Open Developer Tool"];
        if (menu) [menu setTitle:@"オープンデベロッパーツール"];
        
        //menu2 = [[menu submenu] itemAtIndex:[[menu submenu] numberOfItems]-1];
        //[menu2 setTitle:@"他の開発者ツールを探す"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Services"];
        if (menu) [menu setTitle:@"サービス"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Hide Xcode"];
        if (menu) [menu setTitle:@"Xcodeを隠す"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Hide Others"];
        if (menu) [menu setTitle:@"Xcode以外を隠す"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Show All"];
        if (menu) [menu setTitle:@"すべてを表示する"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Quit Xcode"];
        if (menu) [menu setTitle:@"Xcodeを終了する"];
        
    }
    
    
    topmenu = [[NSApp mainMenu] itemWithTitle:@"File"];
    if ( topmenu ) {
        
        
        menu = [[topmenu submenu] itemWithTitle:@"New"];
        if (menu) [menu setTitle:@"新規作成"];
        
        menu2 = [[menu submenu] itemWithTitle:@"Tab"];
        if (menu2) [menu2 setTitle:@"タブを追加する"];
        
        menu2 = [[menu submenu] itemWithTitle:@"Window"];
        if (menu2) [menu2 setTitle:@"新しいウィンドウを開く"];
        
        menu2 = [[menu submenu] itemAtIndex:3];
        if (menu2) [menu2 setTitle:@"ファイルを作成する"];
        
        menu2 = [[menu submenu] itemAtIndex:4];
        if (menu2) [menu2 setTitle:@"ターゲットを作成する"];
        
        menu2 = [[menu submenu] itemAtIndex:5];
        if (menu2) [menu2 setTitle:@"プロジェクトを作成する"];
        
        menu2 = [[menu submenu] itemAtIndex:6];
        if (menu2) [menu2 setTitle:@"ワークスペースを作成する"];
        
        menu2 = [[menu submenu] itemWithTitle:@"Group"];
        if (menu2) [menu2 setTitle:@"グループ(フォルダ)を作成する"];
        
        menu2 = [[menu submenu] itemWithTitle:@"Group from Selection"];
        if (menu2) [menu2 setTitle:@"選択されたアイテムをグループ(フォルダ)にまとめる"];
        
        menu = [[topmenu submenu] itemAtIndex:2];
        if (menu) [menu setTitle:@"プロジェクトへファイルを追加する"];
        
        menu = [[topmenu submenu] itemAtIndex:4];
        if (menu) [menu setTitle:@"ファイルを開く"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Open Recent"];
        if (menu) [menu setTitle:@"最近使ったファイルを開く"];
        
        menu = [[topmenu submenu] itemAtIndex:6];
        if (menu) [menu setTitle:@"ファイル名を入力して開く"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Close Window"];
        if (menu) [menu setTitle:@"ウィンドウを閉じる"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Close Tab"];
        if (menu) [menu setTitle:@"タブを閉じる"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Close Project"];
        if (menu) [menu setTitle:@"プロジェクトを閉じる"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Save"];
        if (menu) [menu setTitle:@"保存"];
        
        menu = [[topmenu submenu] itemAtIndex:16];
        if (menu) [menu setTitle:@"複製を保存する"];
        
        menu = [[topmenu submenu] itemAtIndex:18];
        if (menu) [menu setTitle:@"最後に保存した状態へ戻す"];
        
        menu = [[topmenu submenu] itemAtIndex:19];
        if (menu) [menu setTitle:@"ロックを解除する"];
        
        menu = [[topmenu submenu] itemAtIndex:20];
        if (menu) [menu setTitle:@"書き出す"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Show in Finder"];
        if (menu) [menu setTitle:@"Finderで表示する"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Open"];
        if (menu) [menu setTitle:@"Finderで表示する"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Open with External Editor"];
        if (menu) [menu setTitle:@"外部エディタで開く"];
        
        menu = [[topmenu submenu] itemAtIndex:25];
        if (menu) [menu setTitle:@"ワークスペースとして保存する"];
        
        menu = [[topmenu submenu] itemAtIndex:26];
        if (menu) [menu setTitle:@"プロジェクト設定"];
        
        menu = [[topmenu submenu] itemAtIndex:28];
        if (menu) [menu setTitle:@"スナップショットを作成する"];
        
        menu = [[topmenu submenu] itemAtIndex:29];
        if (menu) [menu setTitle:@"スナップショットからリストアする"];
        
        menu = [[topmenu submenu] itemAtIndex:31];
        if (menu) [menu setTitle:@"ページ設定"];
        
        menu = [[topmenu submenu] itemAtIndex:32];
        if (menu) [menu setTitle:@"印刷"];
        
        
        
    }
    
    topmenu = [[NSApp mainMenu] itemWithTitle:@"Edit"];
    if ( topmenu ) {
        
        menu = [[topmenu submenu] itemWithTitle:@"Undo"];
        if (menu) [menu setTitle:@"取り消す"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Redo"];
        if (menu) [menu setTitle:@"やり直す"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Cut"];
        if (menu) [menu setTitle:@"カット"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Copy"];
        if (menu) [menu setTitle:@"コピー"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Paste"];
        if (menu) [menu setTitle:@"ペースト"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Special Paste"];
        if (menu) [menu setTitle:@"形式を選択してペーストする"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Paste and Preserve Formatting"];
        if (menu) [menu setTitle:@"書式を保持してペーストする"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Duplicate"];
        if (menu) [menu setTitle:@"選択部分を複製"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Delete"];
        if (menu) [menu setTitle:@"削除"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Select All"];
        if (menu) [menu setTitle:@"すべてを選択"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Filter"];
        if (menu) [menu setTitle:@"フィルター"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Sort"];
        if (menu) [menu setTitle:@"並び替え"];
        
        menu2 = [[menu submenu] itemWithTitle:@"By Name"];
        if (menu2) [menu2 setTitle:@"ファイル名順"];
        
        menu2 = [[menu submenu] itemWithTitle:@"By Type"];
        if (menu2) [menu2 setTitle:@"種類順"];
        
        
        
        menu = [[topmenu submenu] itemWithTitle:@"Format"];
        if (menu) [menu setTitle:@"書式"];
        
        menu2 = [[menu submenu] itemWithTitle:@"Font"];
        if (menu2) [menu2 setTitle:@"フォント"];
        
        menu2 = [[menu submenu] itemWithTitle:@"Text"];
        if (menu2) [menu2 setTitle:@"テキスト"];
        
        menu2 = [[menu submenu] itemWithTitle:@"Speling and Grammar"];
        if (menu2) [menu2 setTitle:@"スペルと文法"];
        
        menu2 = [[menu submenu] itemWithTitle:@"Substitutions"];
        if (menu2) [menu2 setTitle:@"代替"];
        
        
        
        menu = [[topmenu submenu] itemWithTitle:@"Refactor"];
        if (menu) [menu setTitle:@"リファクタリング"];
        
        menu2 = [[menu submenu] itemWithTitle:@"Rename…"];
        if (menu2) [menu2 setTitle:@"名称変更"];
        
        menu2 = [[menu submenu] itemWithTitle:@"Extract…"];
        if (menu2) [menu2 setTitle:@"メソッドの切り出し"];
        
        menu2 = [[menu submenu] itemWithTitle:@"Create Superclass…"];
        if (menu2) [menu2 setTitle:@"スーパークラスの作成"];
        
        menu2 = [[menu submenu] itemWithTitle:@"Encapsulate…"];
        if (menu2) [menu2 setTitle:@"カプセル化"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Start Dictation…"];
        if (menu2) [menu setTitle:@"音声入力"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Special Characters…"];
        if (menu) [menu setTitle:@"絵文字入力"];
        
        
    }
    

    topmenu = [[NSApp mainMenu] itemWithTitle:@"View"];
    if (topmenu) {
        
        menu = [[topmenu submenu] itemWithTitle:@"Standard Editor"];
        if (menu) [menu setTitle:@"標準エディタ"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Assistant Editor"];
        if (menu) [menu setTitle:@"補助エディタ"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Version Editor"];
        if (menu) [menu setTitle:@"バージョンエディタ"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Navigators"];
        if (menu) [menu setTitle:@"ナビゲータ"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Debug Area"];
        if (menu) [menu setTitle:@"デバッグエリア"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Utilities"];
        if (menu) [menu setTitle:@"ユーティリティ"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Hide Toolbar"];
        if (menu) [menu setTitle:@"ツールバーを隠す"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Show Tab Bar"];
        if (menu) [menu setTitle:@"タブバーを表示する"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Enter Full Screen"];
        if (menu) [menu setTitle:@"フルスクリーンモード"];
        

        
    }
    
    topmenu = [[NSApp mainMenu] itemWithTitle:@"Find"];
    if (topmenu) {
        
        menu = [[topmenu submenu] itemWithTitle:@"Find in Project…"];
        if (menu) [menu setTitle:@"プロジェクト内を検索する"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Find in Workspace…"];
        if (menu) [menu setTitle:@"ワークスペース内を検索する"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Find Selected Text in Workspace…"];
        if (menu) [menu setTitle:@"選択されたテキストをワークスペース内で検索する"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Find Selected Text in Project…"];
        if (menu) [menu setTitle:@"選択されたテキストをプロジェクト内で検索する"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Find…"];
        if (menu) [menu setTitle:@"検索"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Find and Replace…"];
        if (menu) [menu setTitle:@"検索と置換"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Find Next"];
        if (menu) [menu setTitle:@"次を検索"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Find Previous"];
        if (menu) [menu setTitle:@"前を検索"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Replace"];
        if (menu) [menu setTitle:@"置換"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Replace All"];
        if (menu) [menu setTitle:@"すべて置換"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Replace and Find Next"];
        if (menu) [menu setTitle:@"置換して次へ"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Replace and Find Previous"];
        if (menu) [menu setTitle:@"置換して前へ"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Hide Find Bar"];
        if (menu) [menu setTitle:@"検索窓を隠す"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Use Selection for Find"];
        if (menu) [menu setTitle:@"選択を検索処理"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Use Selection for Replace"];
        if (menu) [menu setTitle:@"選択を置換処理"];
        
        
        
        
    }
    
    topmenu = [[NSApp mainMenu] itemWithTitle:@"Navigate"];
    if (topmenu) {
        
        menu = [[topmenu submenu] itemWithTitle:@"Reveal in Project Navigator"];
        if (menu) [menu setTitle:@"プロジェクトナビゲーターを表示"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Reveal in Symbol Navigator"];
        if (menu) [menu setTitle:@"シンボルナビゲーターを表示"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Reveal in Debug Navigator"];
        if (menu) [menu setTitle:@"デバッグナビゲーターを表示"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Open in Assistant Editor"];
        if (menu) [menu setTitle:@"アシスタントエディタを表示"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Open in…"];
        if (menu) [menu setTitle:@"レイアウトを選んで開く"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Move Focus To Next Area"];
        if (menu) [menu setTitle:@"フォーカスを次へ移す"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Open in…"];
        if (menu) [menu setTitle:@"レイアウトを選んで開く"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Go Forward"];
        if (menu) [menu setTitle:@"次へ"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Go Back"];
        if (menu) [menu setTitle:@"前へ"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Jump to Selection"];
        if (menu) [menu setTitle:@"選択位置へ移動"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Jump to Definition"];
        if (menu) [menu setTitle:@"宣言位置へ移動"];
        
    }
    
    topmenu = [[NSApp mainMenu] itemWithTitle:@"Editor"];
    if (topmenu) {
        
        menu = [[topmenu submenu] itemWithTitle:@"Show Completions"];
        if (menu) [menu setTitle:@"コード補完を表示"];

        
        
        
    }
    
    topmenu = [[NSApp mainMenu] itemWithTitle:@"Product"];
    if (topmenu) {
        
        menu = [[topmenu submenu] itemWithTitle:@"Run"];
        if (menu) [menu setTitle:@"ビルドして実行"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Test"];
        if (menu) [menu setTitle:@"テスト実行"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Analyze"];
        if (menu) [menu setTitle:@"解析"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Archive"];
        if (menu) [menu setTitle:@"アーカイブ"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Build For"];
        if (menu) [menu setTitle:@"ビルド方法"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Build"];
        if (menu) [menu setTitle:@"ビルド"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Clean"];
        if (menu) [menu setTitle:@"クリーン"];
        

        
        
        
    }
    
    topmenu = [[NSApp mainMenu] itemWithTitle:@"Debug"];
    if (topmenu) {
        
        menu = [[topmenu submenu] itemWithTitle:@"Simulate Location"];
        if (menu) [menu setTitle:@"偽装位置情報"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Deactive Breakpoints"];
        if (menu) [menu setTitle:@"ブレークポイントを無効"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Active Breakpoints"];
        if (menu) [menu setTitle:@"ブレークポイントを有効"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Breakpoints"];
        if (menu) [menu setTitle:@"ブレークポイント"];
        
        
        
        
    }
    
    topmenu = [[NSApp mainMenu] itemWithTitle:@"Source Control"];
    if (topmenu) {
        
        menu = [[topmenu submenu] itemWithTitle:@"Check Out…"];
        if (menu) [menu setTitle:@"チェックアウト"];
        
        
        
        
    }
    
    topmenu = [[NSApp mainMenu] itemWithTitle:@"Window"];
    if (topmenu) {
        
        menu = [[topmenu submenu] itemWithTitle:@"Minimize"];
        if (menu) [menu setTitle:@"最小化"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Zoom"];
        if (menu) [menu setTitle:@"最大化"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Select Next Tab"];
        if (menu) [menu setTitle:@"次のタブを表示"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Select Previous Tab"];
        if (menu) [menu setTitle:@"前のタブを表示"];
    
        menu = [[topmenu submenu] itemWithTitle:@"Welcome to Xcode"];
        if (menu) [menu setTitle:@"ようこそ画面を表示"];
        
        menu = [[topmenu submenu] itemWithTitle:@"Organizer"];
        if (menu) [menu setTitle:@"オーガナイザを起動"];
        
        
        if ( !boAddMenu ) {
            
            [[topmenu submenu] addItem:[NSMenuItem separatorItem]];
            
            NSMenuItem *itm1 = [[NSMenuItem alloc] initWithTitle:@"Mokosoft開発者ブログ" action:@selector(moko_open) keyEquivalent:@""];
            [itm1 setTarget:self];
            [[topmenu submenu] addItem:itm1];
            
            boAddMenu = YES;
            
        }
        
        
        
    }
    
    topmenu = [[NSApp mainMenu] itemWithTitle:@"Help"];
    if (topmenu) {
        
        
        
    }
    

    
}

-(void)moko_open
{
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"http://blog.mokosoft.com/"]];
}



@end
