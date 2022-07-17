<!DOCTYPE html>

<html lang="zh-CN" id="html">

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

    <title>DST 存档创建</title>

    <script src="/lib/layui-v2.3.0/layui.js" charset="utf-8"></script>

    <#--<link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png">-->

    <link rel="stylesheet" href="/css/config.css">
    <script>
        if (!!window.ActiveXObject || 'ActiveXObject' in window) {
            document.write(
                '<div style="position: absolute; bottom: 50%; left: 50%; line-height: 1; transform: translate(-50%);cursor: default; font-size: 4vw;">' +
                '<strong>󰀐：你是好人！<br><br>󰀐：猪人不喜欢 IE ！</strong></div>'
            );
            document.execCommand("Stop"); // ie  // window.stop(); // not ie
        }
    </script>
    <style id="dark_style"></style>
    <script>
        const dark_css = 'html,\n' +
            'img,\n' +
            '#lightbulb,\n' +
            '.emoji_item,\n' +
            '.emoji_text,\n' +
            '.mod_card_img_add,\n' +
            '.label_change_value,\n' +
            '.cluster_item_div_input,\n' +
            '.emoji_bar_button:hover,\n' +
            '.emoji_bar_button.active,\n' +
            '.label_change_value:active,\n' +
            '.emoji_bar_button.active.copy_right::before {\n' +
            '    filter: invert(100%) hue-rotate(180deg) !important;\n' +
            '}\n' +
            '.emoji_bar_button {\n' +
            '    filter: invert(100%) hue-rotate(180deg) grayscale(100%) !important;\n' +
            '}\n' +
            '.mod_card_img,\n' +
            '.set_item_img_div {\n' +
            '    filter: invert(100%) hue-rotate(180deg) opacity(75%) !important;\n' +
            '}\n' +
            '.main,\n' +
            '.bar {\n' +
            '    box-shadow: 0 0 0 .24vw #ddd !important;\n' +
            '    border-color: transparent !important;\n' +
            '}\n';

        function light() {
            const style = document.getElementById('dark_style');
            style.innerText = style.innerText ? '' : dark_css;
        }

        // 判断是否匹配深色模式
        const darkMode = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)');
        if (darkMode && darkMode.matches) {
            document.getElementById('dark_style').innerText = dark_css
        }
    </script>
    <script src="/js/config.js" charset="utf-8" defer></script>

    <!--    <link rel="prefetch" href="https://可能加入的缩略图" as="image" type="image" crossorigin="anonymous">-->
    <link rel="preload"
          href="https://cdn.jsdelivr.net/gh/sukeme/DstServerHelper@40e737a7024aea7ca5a1fc283591a54a623b6ae5/others/Dst Emoji.woff2"
          as="font" type="font/woff2" crossorigin="anonymous">
    <link rel="preload" href="/misc/dst_world_setting.json" as="fetch" type="text" crossorigin="anonymous">

</head>

<body class="fullpage" id="fullpage">

<div class="main" id="main">
    <!--    <div class="main_header" id="test"><p>你好󰀍󰀐󰀍你好</p></div>-->
    <div class="main_content hide show" id="content_readme">
        如果你觉得页面卡，那应该将此页面添加到 去广告插件 的白名单中，或暂时关闭 去广告插件
    </div>
    <div class="main_content hide" id="content_cluster_setting">
        <div class="content_item content_sidebar">
            <div class="cluster_title">
                <h4 class="cluster_title_con">房间设置</h4>
            </div>
            <div class="content_sidebar_con">
                <div class="content_sidebar_button_div">
                    <button class="cluster content_sidebar_button show_button" id="button_cluster">房间信息
                    </button>
                </div>
                <div class="content_sidebar_button_div">
                    <button class="cluster content_sidebar_button show_button" id="button_token">&ensp;令&emsp;牌&ensp;
                    </button>
                </div>
                <div class="content_sidebar_button_div">
                    <button class="cluster content_sidebar_button show_button" id="button_admin">管&ensp;理&ensp;员
                    </button>
                </div>
                <div class="content_sidebar_button_div">
                    <button class="cluster content_sidebar_button show_button" id="button_white">白&ensp;名&ensp;单
                    </button>
                </div>
                <div class="content_sidebar_button_div">
                    <button class="cluster content_sidebar_button show_button" id="button_black">黑&ensp;名&ensp;单
                    </button>
                </div>
            </div>
        </div>
        <div class="cluster content_item content_focus hide show" id="content_cluster">
            <div class="focus_item focus_edit">
                <div class="cluster_title">
                    <h4 class="cluster_title_con">房间信息</h4>
                </div>
                <form class="cluster_item_con edit_items" id="form_cluster" name="cluster" autocomplete="off">
                    <div class="cluster_item_list cluster_important">
                        <div class="cluster_item_list_title">
                            重要
                        </div>

                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_cluster_name">
                                房间名称
                            </label>
                            <div class="cluster_item_div">
                                <textarea class="cluster_item_div_input no_check show_button" id="button_cluster_name"
                                          name="cluster_name" rows="1" maxlength="100"></textarea>
                            </div>
                        </div>

                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_max_players">
                                玩家人数
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input show_button" id="button_max_players"
                                       name="max_players" type="tel" pattern="[0-9]{1,2}">
                            </div>
                        </div>
                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_game_mode">
                                游戏模式
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input input_fixed no_select show_button"
                                       id="button_game_mode" name="game_mode" type="text" readonly>
                            </div>
                        </div>
                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_cluster_description">
                                房间描述
                            </label>
                            <div class="cluster_item_div">
                                <textarea class="cluster_item_div_input no_check show_button"
                                          id="button_cluster_description"
                                          name="cluster_description" rows="1" maxlength="200"></textarea>
                            </div>
                        </div>

                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_cluster_password">
                                密码
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input no_check show_button" id="button_cluster_password"
                                       name="cluster_password" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="cluster_item_list cluster_unimportant">
                        <div class="cluster_item_list_title">
                            不重要
                        </div>
                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_vote_enabled">
                                投票功能
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input input_fixed no_select show_button"
                                       id="button_vote_enabled" name="vote_enabled" type="text" readonly>
                            </div>
                        </div>

                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_max_snapshots">
                                快照数量
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input show_button" id="button_max_snapshots"
                                       name="max_snapshots" type="tel" pattern="\d+">
                            </div>
                        </div>

                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_console_enabled">
                                控制台
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input input_fixed no_select show_button"
                                       id="button_console_enabled" name="console_enabled" type="text" readonly>
                            </div>
                        </div>

                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_pvp">
                                玩家对战
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input input_fixed no_select show_button" id="button_pvp"
                                       name="pvp" type="text" readonly>
                            </div>
                        </div>
                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_cluster_intention">
                                游戏风格
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input input_fixed no_select show_button"
                                       id="button_cluster_intention" name="cluster_intention" type="text" readonly>
                            </div>
                        </div>
                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_whitelist_slots">
                                保留栏位
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input show_button" id="button_whitelist_slots"
                                       name="whitelist_slots" type="text" pattern="\d+">
                            </div>
                        </div>
                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_tick_rate">
                                通信频率
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input input_fixed no_select show_button"
                                       id="button_tick_rate" name="tick_rate" type="text" readonly>
                            </div>
                        </div>

                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_cluster_language">
                                游戏语言
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input input_fixed no_select show_button"
                                       id="button_cluster_language" name="cluster_language" type="text" readonly>
                            </div>
                        </div>
                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_idle_timeout" lang="">
                                挂机超时
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input show_button" id="button_idle_timeout"
                                       name="idle_timeout" type="text" pattern="\d+">
                            </div>
                        </div>
                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_pause_when_empty">
                                无人暂停
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input input_fixed no_select show_button"
                                       id="button_pause_when_empty" name="pause_when_empty" type="text" readonly>
                            </div>
                        </div>
                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_autosaver_enabled">
                                自动存档
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input input_fixed no_select show_button"
                                       id="button_autosaver_enabled" name="autosaver_enabled" type="text" readonly>
                            </div>
                        </div>

                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_lan_only_cluster">
                                局域网模式
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input input_fixed no_select show_button"
                                       id="button_lan_only_cluster" name="lan_only_cluster" type="text" readonly>
                            </div>
                        </div>

                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_offline_cluster">
                                离线模式
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input input_fixed no_select show_button"
                                       id="button_offline_cluster" name="offline_cluster" type="text" readonly>
                            </div>
                        </div>

                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_override_dns">
                                DNS
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input show_button" id="button_override_dns"
                                       name="override_dns" type="text"
                                       pattern="([0-1]?[0-9]{1,2}|2([0-4][0-9]|5[0-5]))(\.[0-1]?[0-9]{1,2}|2([0-4][0-9]|5[0-5])){3}(,([0-1]?[0-9]{1,2}|2([0-4][0-9]|5[0-5]))(\.[0-1]?[0-9]{1,2}|2([0-4][0-9]|5[0-5])){3})?">
                            </div>
                        </div>
                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_connection_timeout">
                                连接超时
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input show_button" id="button_connection_timeout"
                                       name="connection_timeout" type="text" pattern="\d+">
                            </div>
                        </div>

                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_autocompiler_enabled">
                                贴图转换
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input input_fixed no_select show_button"
                                       id="button_autocompiler_enabled" name="autocompiler_enabled" type="text" readonly>
                            </div>
                        </div>

                    </div>
                    <div class="cluster_item_list cluster_steam">
                        <div class="cluster_item_list_title">
                            STEAM
                        </div>
                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_steam_group_id">
                                群组 ID
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input show_button" id="button_steam_group_id"
                                       name="steam_group_id" type="text" pattern="\d+">
                            </div>
                        </div>

                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_steam_group_only">
                                仅群组
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input input_fixed no_select show_button"
                                       id="button_steam_group_only" name="steam_group_only" type="text" readonly>
                            </div>
                        </div>

                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_steam_group_admins">
                                群组管理员
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input input_fixed no_select show_button"
                                       id="button_steam_group_admins" name="steam_group_admins" type="text" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="cluster_item_list cluster_unsafe">
                        <div class="cluster_item_list_title">
                            慎点
                        </div>
                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_shard_enabled">
                                多世界
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input input_fixed no_select show_button"
                                       id="button_shard_enabled" name="shard_enabled" type="text" readonly>
                            </div>
                        </div>

                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_bind_ip">
                                从世界 IP
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input show_button" id="button_bind_ip" name="bind_ip"
                                       type="text"
                                       pattern="([0-1]?[0-9]{1,2}|2([0-4][0-9]|5[0-5]))(\.[0-1]?[0-9]{1,2}|2([0-4][0-9]|5[0-5])){3}">
                            </div>
                        </div>

                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_master_ip">
                                主世界 IP
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input show_button" id="button_master_ip" name="master_ip"
                                       type="text"
                                       pattern="([0-1]?[0-9]{1,2}|2([0-4][0-9]|5[0-5]))(\.[0-1]?[0-9]{1,2}|2([0-4][0-9]|5[0-5])){3}">
                            </div>
                        </div>

                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_master_port">
                                通信端口
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input show_button" id="button_master_port"
                                       name="master_port" type="text" onblur="fix_world_info()"
                                       pattern="0*(1((0(2[5-9]|[3-9][0-9]))|([1-9][0-9]{2}))|[2-9][0-9]{3}|[1-6][0-9]{4})">
                            </div>
                        </div>

                        <div class="cluster_edit_item">
                            <label class="cluster_item_label" for="button_cluster_key">
                                通信密码
                            </label>
                            <div class="cluster_item_div">
                                <input class="cluster_item_div_input show_button" id="button_cluster_key"
                                       name="cluster_key" type="text" pattern=".+">
                            </div>
                        </div>
                    </div>
                </form>
            </div>

            <div class="focus_item focus_desc">
                <div class="cluster_title">
                    <h4 class="cluster_title_con">描述</h4>
                </div>
                <div class="cluster_item_con desc_items">
                    <div class="cluster_item_list desc_item_list">
                        <div class="desc_for_cluster cluster_desc_item hide show" id="content2_cluster">
                            <div>
                                <p class="cluster_desc_text">
                                    房间设置
                                </p>
                                <p class="cluster_desc_text">
                                    在这里对房间信息进行修改
                                </p>
                            </div>
                        </div>
                        <div class="desc_for_cluster cluster_desc_item hide" id="content_cluster_name">
                            <div>
                                <p class="cluster_desc_text">
                                    房间名称
                                </p>
                                <p class="cluster_desc_text">
                                    大厅列表中最多显示 35 个汉字，英文数字稍多一些。<br>
                                    不推荐取过长的名称。
                                </p>

                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：[Host]'s World
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_max_players">
                            <div>
                                <p class="cluster_desc_text">
                                    服务器可容纳的玩家数量上限
                                </p>
                                <p class="cluster_desc_text">
                                    人数越多，服务器压力越大。<br>
                                    对云服而言，1c2g 推荐 4 人，2c4g 推荐 6-8 人。
                                </p>
                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：16
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_game_mode">
                            <div>
                                <p class="cluster_desc_text">
                                    游戏模式
                                </p>
                                <p class="cluster_desc_text">
                                    主要有 生存、无尽、荒野，加上活动的 熔炉、暴食，部分 mod 会自定义模式，统一归为自定义 六种。<br>
                                    生存：玩家死亡队友会持续掉 san；当房间内没有活着的玩家达到 120s 后，世界会被重置。<br>
                                    无尽：玩家死亡后可通过作祟恶魔大门复活；基础作物如草根、树苗等会随时间缓慢再生。<br>
                                    荒野：玩家选人后会随机出生在地图不同位置；玩家死亡后不会变成鬼魂，而是重选人物重新开始。<br>
                                    <br>
                                    熔炉：官方活动其一。模式主要以打怪闯关为主，抵御并击败敌人。<br>
                                    暴食：官方活动其二。模式主要以烹饪为主，在固定场景中收集食材并做出满足饕餮要求的食物。<br>
                                    自定义：由 mod 自行定义玩法。
                                </p>

                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：生存
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_cluster_description">
                            <div>
                                <p class="cluster_desc_text">
                                    房间描述
                                </p>
                                <p class="cluster_desc_text">
                                    对本房间的介绍。
                                </p>

                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：无
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_cluster_password">
                            <div>
                                <p class="cluster_desc_text">
                                    房间密码
                                </p>
                                <p class="cluster_desc_text">
                                    设置密码，进入房间时需要输入正确的密码才可以进入。<br>
                                    留空表示不设密码，其他玩家可自由进入。
                                </p>

                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：无
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_vote_enabled">
                            <div>
                                <p class="cluster_desc_text">
                                    是否开启投票功能
                                </p>
                                <p class="cluster_desc_text">
                                    开启后可通过投票进行 踢出玩家、回档、重置世界 操作。
                                </p>
                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：开启
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_max_snapshots">
                            <div>
                                <p class="cluster_desc_text">
                                    服务器保留的快照数量上限
                                </p>
                                <p class="cluster_desc_text">
                                    默认情况下，服务器会在新的一天开始时对服务器存档，生成一份快照。保留的快照数量决定了可回档的天数上限。<br>
                                    在世界内有玩家存在时，服务器不会清理该世界的快照。
                                </p>
                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：6
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_console_enabled">
                            <div>
                                <p class="cluster_desc_text">
                                    是否开启控制台
                                </p>
                                <p class="cluster_desc_text">
                                    开启控制台后，可以通过游戏内置指令或 lua 代码对游戏进行修改。
                                </p>
                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：开启
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_pvp">
                            <div>
                                <p class="cluster_desc_text">
                                    是否开启玩家对战
                                </p>
                                <p class="cluster_desc_text">
                                    开启后玩家可互相攻击，部分判定会有变化 如排箫可以催眠其他玩家 等。
                                </p>
                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：关闭
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_cluster_intention">
                            <div>
                                <p class="cluster_desc_text">
                                    游戏风格
                                </p>
                                <p class="cluster_desc_text">
                                    主要有 社交、合作、竞争、疯狂 四种。<br>
                                    展示该房间的游戏倾向，是友好社交还是兵戎相见。但不会影响游戏内容。
                                </p>

                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：随游戏模式变化。<br>
                                    生存/合作、无尽/社交、荒野/竞争、熔炉/疯狂、暴食/疯狂
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_whitelist_slots">
                            <div>
                                <p class="cluster_desc_text">
                                    为白名单内玩家保留的位置数量
                                </p>
                                <p class="cluster_desc_text">
                                    设置后，该数量的位置只允许白名单内玩家占据，其他玩家共享剩余的位置。<br><br>
                                    关于 保留栏位 与 白名单，实际保留栏位 并不等于 设置的保留栏位 ，而是 设置保留栏位 与 白名单中ID数量 两者中较小的那个值。
                                </p>

                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：0
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_tick_rate">
                            <div>
                                <p class="cluster_desc_text">
                                    客户端与服务器之间每秒通信的次数
                                </p>
                                <p class="cluster_desc_text">
                                    性能满足的情况下，通信频率越高，游戏越流畅、体验越好，但会大幅提高服务器的运行压力。
                                    取值应为 可被 60 整除的值，如 15、20、30、60 等。
                                </p>

                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：15
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_cluster_language">
                            <div>
                                <p class="cluster_desc_text">
                                    游戏内语言
                                </p>
                                <p class="cluster_desc_text">
                                    服务器内信息使用的语言，如人物台词等。
                                </p>
                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：en
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_idle_timeout">
                            <div>
                                <p class="cluster_desc_text">
                                    无操作超时时间
                                </p>
                                <p class="cluster_desc_text">
                                    客户端无操作超过该时间后将会被断开连接。<br>
                                    单位：秒。
                                </p>

                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：1800
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_pause_when_empty">
                            <div>
                                <p class="cluster_desc_text">
                                    无人时是否暂停
                                </p>
                                <p class="cluster_desc_text">
                                    在服务器内没有玩家时，世界时间是否暂停。
                                </p>

                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：否
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_autosaver_enabled">
                            <div>
                                <p class="cluster_desc_text">
                                    是否开启自动存档
                                </p>
                                <p class="cluster_desc_text">
                                    开启后服务器会在新的一天开始时存档，生成一份快照。<br><br>
                                    关于存档与快照数量，游戏实际并不会监测快照数量并对其限制，而是在保存快照时，检测并清理没有玩家的世界的多余快照
                                </p>
                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：是
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_lan_only_cluster">
                            <div>
                                <p class="cluster_desc_text">
                                    是否为局域网联机模式
                                </p>
                                <p class="cluster_desc_text">
                                    联机分为互联网与局域网两种。<br>
                                    局域网联机模式下，大厅不会显示该房间，同时只有和服务器在同一个局域网的玩家才可加入。
                                </p>

                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：否
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_offline_cluster">
                            <div>
                                <p class="cluster_desc_text">
                                    是否为离线模式
                                </p>
                                <p class="cluster_desc_text">
                                    离线模式下不可使用在线功能，比如皮肤等。但仍保留局域网联机功能。
                                </p>
                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：否
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_override_dns">
                            <div>
                                <p class="cluster_desc_text">
                                    指定 DNS 地址
                                </p>
                                <p class="cluster_desc_text">
                                    为服务器指定 DNS 的地址。<br>
                                    连接很慢时可以考虑指定 DNS，也许会有改善。<br>
                                    linux 不可用，其它平台不知。<br>
                                    例：8.8.8.8,8.8.4.4
                                </p>
                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：无
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_connection_timeout">
                            <div>
                                <p class="cluster_desc_text">
                                    连接超时时间
                                </p>
                                <p class="cluster_desc_text">
                                    客户端连接服务器的超时时间，超过该时间还没有成功连接的话，就会被服务器断开连接<br>
                                    不要改的过短，客户端会直接连接失败<br>
                                    单位：毫秒
                                </p>
                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：8000
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_autocompiler_enabled">
                            <div>
                                <p class="cluster_desc_text">
                                    mod中贴图格式转换
                                </p>
                                <p class="cluster_desc_text">
                                    在安装了饥荒模组工具的情况下，自动对 mod 文件夹中指定位置的 png、scml 等文件进行编译，在同目录下生成对应的饥荒可使用的文件。<br>
                                    仅 Windows 平台可用。
                                </p>
                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：开启
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_steam_group_id">
                            <div>
                                <p class="cluster_desc_text">
                                    steam 群组编号
                                </p>
                                <p class="cluster_desc_text">
                                    每个 steam 群组都有唯一的一串数字与其对应，在这里填写群组编号用于绑定 steam 群组。<br>
                                    绑定后服务器将在群组成员的大厅中优先显示，并附有红色、黄色或白色小旗子标志。
                                </p>
                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：0
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_steam_group_only">
                            <div>
                                <p class="cluster_desc_text">
                                    是否仅允许 steam 群组成员加入
                                </p>
                                <p class="cluster_desc_text">
                                    开启后只有群组成员才可加入，其他玩家不可加入。
                                </p>
                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：否
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_steam_group_admins">
                            <div>
                                <p class="cluster_desc_text">
                                    是否将 steam 群组管理员设为游戏管理员
                                </p>
                                <p class="cluster_desc_text">
                                    开启后，steam 群组的管理员将会自动拥有游戏内管理员身份。
                                </p>
                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：否
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_shard_enabled">
                            <div>
                                <p class="cluster_desc_text">
                                    是否为多世界模式。
                                </p>
                                <p class="cluster_desc_text">
                                    对于饥荒而言，一个世界代表一个独立的服务器进程，所以 地上加地下 一共两个世界也是多服务器模式。<br>
                                    多世界时会根据玩家设置，将某个世界作为主世界，其他世界为从世界。<br>
                                    仅在确定只需要开启单世界时关闭。
                                </p>

                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：否
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_bind_ip">
                            <div>
                                <p class="cluster_desc_text">
                                    从服务器 IP
                                </p>
                                <p class="cluster_desc_text">
                                    从服务器的 IPv4 地址，主服务器监听此 IP 并与其连接。<br>
                                    主从服务器都在同一计算机上时，填 127.0.0.1 （表示本机）；否则填 0.0.0.0 （表示所有 IP ）。<br>
                                    只需要为主服务器设置此项。

                                </p>

                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：127.0.0.1
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_master_ip">
                            <div>
                                <p class="cluster_desc_text">
                                    主服务器 IP
                                </p>
                                <p class="cluster_desc_text">
                                    主服务器的 IPv4 地址，从服务器请求此 IP 并与其连接。<br>
                                    主从服务器都在同一计算机上时，填 127.0.0.1 ；否则填主服务器 IP<br>
                                    只需要为从服务器设置此项
                                </p>

                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：无
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_master_port">
                            <div>
                                <p class="cluster_desc_text">
                                    世界通信端口
                                </p>
                                <p class="cluster_desc_text">
                                    主服务器将监听/从服务器请求与主服务器连接 的UDP端口。<br>
                                    主从服务器应设为相同值
                                </p>

                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：10888
                                </p>
                            </div>
                        </div>

                        <div class="desc_for_cluster cluster_desc_item hide" id="content_cluster_key">
                            <div>
                                <p class="cluster_desc_text">
                                    世界验证密码
                                </p>
                                <p class="cluster_desc_text">
                                    多服务器开服时，服务器间的验证密码
                                </p>

                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：无
                                </p>
                            </div>
                        </div>


                    </div>
                </div>
                <div class="emoji_bar" id="emoji_bar">
                    <div class="emoji_bar_background">
                        <div class="emoji_item_box"><span class="emoji_item">󰀀</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀁</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀂</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀃</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀄</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀅</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀆</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀇</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀈</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀉</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀊</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀋</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀌</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀍</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀎</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀏</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀐</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀑</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀒</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀓</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀔</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀕</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀖</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀗</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀘</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀙</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀚</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀛</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀜</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀝</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀞</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀟</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀠</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀡</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀢</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀣</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀤</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀥</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀦</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀧</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀨</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀩</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀪</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀫</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀬</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀭</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀮</span></div>
                        <div class="emoji_item_box"><span class="emoji_item">󰀯</span></div>
                    </div>
                </div>
                <button class="emoji_bar_button" id="emoji_bar_button"></button>
            </div>

        </div>

        <div class="cluster content_item content_focus hide" id="content_token">
            <div class="focus_item focus_edit">
                <div class="cluster_title">
                    <h4 class="cluster_title_con">令牌</h4>
                </div>
                <form class="cluster_item_con edit_items cluster_others_con" id="form_token" name="token"
                      autocomplete="off">
                    <div class="cluster_item_list">
                        <div class="cluster_edit_item cluster_edit_admin_item">
                            <div class="cluster_item_div cluster_admin_item_div">
                                <label for="button_cluster_token"></label>
                                <input class="cluster_item_div_input" id="button_cluster_token"
                                       name="cluster_token" pattern="pds-g\^KU_[\w-]{8}\^[/+\w]{43}="
                                       placeholder="pds-g^KU_iNDUz9EQ^Fs+rcQpM+INprasSYAlh9obhwrnAwkNMdFYbEcOJRuE=">
                            </div>
                        </div>
                    </div>
                </form>
            </div>


            <div class="focus_item focus_desc">
                <div class="cluster_title">
                    <h4 class="cluster_title_con">描述</h4>
                </div>
                <div class="cluster_item_con desc_items">
                    <div class="cluster_item_list desc_item_list">
                        <div class="desc_for_cluster cluster_desc_item hide just_show" id="content_cluster_token">
                            <div>
                                <p class="cluster_desc_text">
                                    服务器令牌
                                </p>
                                <p class="cluster_desc_text">
                                    维持服务器独立运行的凭证，符合要求的令牌才可以开启服务器。<br><br>
                                    创建令牌的玩家将自动成为使用该令牌开启的服务器的管理员。<br><br>
                                    获取方法可自行百度。
                                </p>
                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：无<br>
                                    &emsp;&emsp;留空将默认使用我的令牌。
                                </p>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="cluster content_item content_focus hide" id="content_admin">
            <div class="focus_item focus_edit">
                <div class="cluster_title">
                    <h4 class="cluster_title_con">管理员</h4>
                </div>
                <form class="cluster_black_con" id="form_admin" name="admin" autocomplete="off">
                    <div class="cluster_black_list kid" id="cluster_adminlist_kid">
                        <p class="cluster_black_list title" id="cluster_adminlist_kid_title"
                           ondblclick="clean_bro(this)">klei id: 共 0 个</p>
                    </div>
                </form>
            </div>
            <div class="focus_item focus_desc">
                <div class="cluster_title">
                    <h4 class="cluster_title_con">描述</h4>
                </div>
                <div class="cluster_item_con desc_items">
                    <div class="cluster_item_list desc_item_list">
                        <div class="desc_for_cluster cluster_desc_item hide just_show" id="content_cluster_admin">
                            <div>
                                <p class="cluster_desc_text">
                                    管理员 KleiID 列表
                                </p>
                                <p class="cluster_desc_text">
                                    管理员可以在游戏内拥有管理权限，包括 踢出玩家、封禁玩家、回档、使用控制台执行指令等。<br><br>
                                    支持 KleiID（KU_xxxxxxxx）。

                                </p>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="desc_input_div_div">
                    <div class="desc_input_div">
                        <input class="desc_input" id="cluster_adminlist_raw" placeholder='输入 ID 或粘贴批量添加'>
                        <label class="desc_label" for="cluster_adminlist_raw">
                            <button class="desc_button" id="cluster_adminlist_raw_button"
                                    onclick="select_userid(this.id, 'cluster_black_item')">添加
                            </button>
                        </label>

                    </div>

                </div>
            </div>
        </div>

        <div class="cluster content_item content_focus hide" id="content_white">
            <div class="focus_item focus_edit">
                <div class="cluster_title">
                    <h4 class="cluster_title_con">白名单</h4>
                </div>
                <form class="cluster_black_con" id="form_white" name="white" autocomplete="off">
                    <div class="cluster_black_list kid" id="cluster_whitelist_kid">
                        <p class="cluster_black_list title" id="cluster_whitelist_kid_title"
                           ondblclick="clean_bro(this)">klei id: 共 0 个</p>
                    </div>
                </form>
            </div>
            <div class="focus_item focus_desc">
                <div class="cluster_title">
                    <h4 class="cluster_title_con">描述</h4>
                </div>
                <div class="cluster_item_con desc_items">
                    <div class="cluster_item_list desc_item_list">
                        <div class="desc_for_cluster cluster_desc_item hide just_show" id="content_cluster_white">
                            <div>
                                <p class="cluster_desc_text">
                                    白名单 KleiID 列表
                                </p>
                                <p class="cluster_desc_text">
                                    加入白名单的玩家将可以使用 保留栏位 的位置，避免其他玩家过多导致不能进入服务器。<br>

                                    > 由于某些 bug，现在<strong>仅允许</strong>列表中<strong>最后一位</strong> ID 的玩家使用
                                    保留栏位，<strong>其他</strong>加入列表的 ID 将会被<strong>忽略</strong>。<br>
                                    所以使用时最好只添加 1 个玩家ID。<br><br>
                                    支持 KleiID（KU_xxxxxxxx）。<br><br>
                                    当然，也可能是我的使用方法有误，如果知晓正确的使用方法并验证可行，欢迎分享给我，我将用来更正这部分错误。<br><br>

                                    关于 保留栏位 与 白名单，实际保留栏位 并不等于 设置的保留栏位 ，而是 设置保留栏位 与 白名单中ID数量 两者中较小的那个值。
                                </p>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="desc_input_div_div">
                    <div class="desc_input_div">
                        <input class="desc_input" id="cluster_whitelist_raw" placeholder='输入 ID 或粘贴批量添加'>
                        <label class="desc_label" for="cluster_whitelist_raw">
                            <button class="desc_button" id="cluster_whitelist_raw_button"
                                    onclick="select_userid(this.id, 'cluster_black_item')">添加
                            </button>
                        </label>

                    </div>

                </div>
            </div>
        </div>

        <div class="cluster content_item content_focus hide" id="content_black">
            <div class="focus_item focus_edit">
                <div class="cluster_title">
                    <h4 class="cluster_title_con">黑名单</h4>
                </div>
                <form class="cluster_black_con" id="form_black" name="black" autocomplete="off">

                    <div class="cluster_black_list kid" id="cluster_blacklist_kid">
                        <p class="cluster_black_list title" id="cluster_blacklist_kid_title"
                           ondblclick="clean_bro(this);">klei id: 共 0 个</p>
                    </div>
                    <div class="cluster_black_list sid" id="cluster_blacklist_sid">
                        <p class="cluster_black_list title" id="cluster_blacklist_sid_title"
                           ondblclick="clean_bro(this);">steam id: 共 0 个</p>
                    </div>
                </form>
            </div>
            <div class="focus_item focus_desc">
                <div class="cluster_title">
                    <h4 class="cluster_title_con">描述</h4>
                </div>
                <div class="cluster_item_con desc_items">
                    <div class="cluster_item_list desc_item_list">
                        <div class="desc_for_cluster cluster_desc_item hide just_show" id="content_cluster_black">
                            <div>
                                <p class="cluster_desc_text">
                                    被封禁玩家列表
                                </p>
                                <p class="cluster_desc_text">
                                    保存在该文件内的 ID 对应的玩家将不能加入该房间。<br><br>
                                    支持 KleiID（KU_xxxxxxxx）和 SteamID（7656xxxxxxxxxxxxx）。
                                </p>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="desc_input_div_div">
                    <div class="desc_input_div">
                        <input class="desc_input" id="cluster_blacklist_raw" placeholder='输入 ID 或粘贴批量添加'
                               value="KU_3Dirn3ky KU_3Dirn2AY KU_NmrN-vfm KU_pvwb-fhj KU_A0x_UJRZ KU_tvX4yWm6 KU_3DiroPzS KU_tvX4ycU1 KU_zDb_qqAZ KU_ibiDWhUR KU_p3AjSGYy KU_n0fXOURs KU_Ve0KdzTu KU_0vPtVmoE KU_kTIVBNqe KU_F4GEmukK KU_A0x_UJRZ KU_3xJ73GQD KU_SJvhQ85k KU_SJvhQ85k KU_F4GEmlCw KU_pvwb-QIY KU_kTIVBPgO KU_CKFre7xO KU_l26xzUbr KU__9qL1-ne KU_HDjLJFjn KU_CKFre6rs KU_BmnF41tF KU_3RvV88NC KU_0cJfzg61 KU_0cJfzqIu KU_Qvt-jM9U KU_Zzh0_OUi KU_GLJ5k4y1 KU_XE0s3UIh KU_Qvt-jdwB KU_3RvV9fV4 KU_FzX9zPc6 KU_xI2uphav KU_oX0uXq21 KU_3prf2gb0 KU_q7g66f7v KU_QSHhEez- KU_3DiroNSj KU_Qvt-jcGJ KU_tvX4yExP KU_2i1Lqy_f KU_UJWCheBU KU_OtxIwog6 KU_gwdm4sAF KU_j8yEjBo2 KU_0j0lUOdf KU_HQp7BVOe KU_dwt6dupD KU_hjXTcnhk KU_54sjcuOa KU_MAFS6cQ9 KU_2duLJZmE KU_MAFS6dDI 76561199028593386 76561199010584560 76561198992534421 76561198992316442 76561198986553968 76561198963351986 76561198929340408 76561198901313063 76561198882590134 76561198863218237 76561198980630816 76561198861168198 76561198856955119 76561198841866218 76561198835739844 76561198824673627 76561198822588587 76561198229985584 76561198821601145 76561198805250116 76561198802192309 76561198799841170 76561198760987526 76561198449089141 76561198448400527 76561198448291800 76561198445838968 76561198443940664 76561198442350109 76561198439971919 76561198439419768 76561198436009640 76561198435734771 76561198432561013 76561198427852413 76561198427578907 76561198426134976 76561198426002331 76561198420173391 76561198411608604 76561198411508260 76561198402542117 76561198401963287 76561198401827605 76561198399516897 76561198396815889 76561198395082554 76561198389646833 76561198384496116 76561198380447518 76561198378835447 76561198373411286 76561198373258533 76561198371575389 76561198365719361 76561198360200700 76561198359432248 76561198358308769 76561198353713646 76561198350492465 76561198349554206 76561198347943698 76561198344888750 76561198344053010 76561198341891490 76561198340750880 76561198339302519 76561198333354639 76561198328204910 76561198323565922 76561198319729186 76561198315504555 76561198313721292 76561198301710429 76561198286689762 76561198285746172 76561198282314150 76561198281904766 76561198276738766 76561198275358974 76561198274610120 76561198272309775 76561198255210115 76561198250529136 76561198247485560 76561198236254770 76561198213974149 76561198210896512 76561198209393933 76561198194633403 76561198192077062 76561198180954303 76561198176543833 76561198168099320 76561198165651196 76561198155651901 76561198154253770 76561198135151190 76561198124691155 76561198114380758 76561198113361690 76561198097904098 76561198091705333 76561198074593812 76561198034194854 76561198033023213 76561198006678168 76561198005887853 76561197998903484 76561199042742553 76561199014138890 76561198307210875 76561198895030854 76561199003426942 76561199032256758 76561198401121545 76561199080776777 76561198822332121 76561198430805987 76561198887212214 76561199079741333 76561198813547473  KU_MAFS6B4u KU_vCuBSwG4 KU_UQsKYZBK KU_FzX9zk9g KU_cZLtrDLd KU_88VA0vDy KU_77voq6gM KU_Odm4vV2m KU_Wwg8fwRx KU_Gi0-qmqN KU_coR-lm5M KU_PPgpTCsJ KU_ZYP7ZfCp KU_GLJ5k9Z3 KU_oX0uXqCK KU_2i1Lqry5 KU_dsu8_wgZ 76561198420118404 76561199026868250 76561199075481613 76561198954333206  KU_Gi0-qWhc KU_PP5FpAyr KU_4735k1bl KU_HQp7BLBN KU_F4GEnHNQ KU_fXPG_yfv KU_Gi0-qmtw KU_XruxGomD KU_u0cSuTzn KU_5rWXYSPK KU_ASjiAY49 KU_kTIVBRpT KU_bkBUBlPD KU_4KZrzPm4 KU_9z6URtby KU_KSZYEdhm KU_t-6yZiuI KU_qSD2iOw0 KU_HQp7BRbr KU_5rWXYHLz KU_RYS8cTJL KU_CKFre6UA KU_fNVmfXex KU_PROlxu07 KU__9qL12Pc KU_SJvhQ8aq KU_FM5EhCFI KU_sv5NuvgV KU_sv5Nuzha KU_iwS7jme2 KU_B4s9Pd8B KU_GLJ5k6sp KU_Qvt-jaeM KU_-sa_EZ_h KU_dsu8_vZF KU_AmxQ_N1w KU_q87X4GpI KU_cZLtrCEt KU_FSLwP3v0 KU_n0Vjv1z5 KU_1W-yG9gf KU_AmxQ_NyN KU_1W-yHDl8 KU_F40CNubA KU_oGt2RxvJ KU_iNDU0AlY KU_sM0lKles KU_tvX4yUkm KU_hjXTcjuN KU_cZLtrAov KU_hjXTc750 KU_MAFS6PIn KU_54sjc2sw KU_hjXTcqBr KU_0j0lUPWj KU_BQAUz54Z KU_84TfuaYU KU_HMWGWuUo KU_MAFS6Z-l KU_3xJ72Wnu KU_dNpFm7na KU_SpqLc48e KU_Gi0-qXtV KU_qCOtoiNB KU_4_WneQFr KU_vCuBS0H_ KU_vCuBTRdN KU_MAFS6asf KU_p3-TA00_ KU_hjXTc7_3 KU_d2kn7P2P KU_Y-MuxkTU KU_vlmcE8_7 KU_ixbEER1U 76561199025559584 76561198425045718 76561198415910022">
                        <label class="desc_label" for="cluster_blacklist_raw">
                            <button class="desc_button" id="cluster_blacklist_raw_button"
                                    onclick="select_userid(this.id, 'cluster_black_item')">添加
                            </button>
                        </label>

                    </div>

                </div>
            </div>
        </div>
    </div>


    <div class="main_content hide" id="content_world">
        <div class="content_item content_sidebar">
            <div class="cluster_title">
                <h4 class="cluster_title_con">世界设置</h4>
            </div>
            <div class="world_sidebar_con" id="world_sidebar">
            </div>
            <div class="world_sidebar_button_div add">
                <button class="world_sidebar_button add" onclick="add_world('forest')">地上
                </button>
                <button class="world_sidebar_button add plus" tabindex="-1">+
                </button>
                <button class="world_sidebar_button add" onclick="add_world('cave')">洞穴
                </button>
            </div>
        </div>
        <div class="content_item content_focus reverse hide just_show" id="world_list">

            <div class="focus_item focus_desc">
                <div class="cluster_title">
                    <h4 class="cluster_title_con">描述</h4>
                </div>
                <div class="cluster_item_con desc_items">
                    <div class="cluster_item_list desc_item_list">

                        <div class="desc_for_world cluster_desc_item hide show" id="content2_world">
                            <div>
                                <p class="cluster_desc_text">
                                    世界
                                </p>
                                <p class="cluster_desc_text">
                                    点击世界列表下方按钮添加世界<br>
                                    点击世界左侧红点删除世界<br>
                                    删改世界后列表顺序并不一定和实际顺序相同，实际顺序请逐一查看各个世界的其他设置中世界id项<br><br>
                                    注意：饥荒程序只会自动连接2个世界，如果世界数量超过两个，记得添加多层世界mod<br>
                                </p>
                            </div>
                        </div>


                        <div class="desc_for_world cluster_desc_item hide show" id="content2_setting_world">
                            <div>
                                <p class="cluster_desc_text">
                                    世界选项
                                </p>
                                <p class="cluster_desc_text">
                                    在这里对世界选项进行修改
                                </p>
                            </div>
                        </div>
                        <div class="desc_for_world cluster_desc_item hide" id="content2_gen_world">
                            <div>
                                <p class="cluster_desc_text">
                                    世界生成
                                </p>
                                <p class="cluster_desc_text">
                                    在这里对世界生成进行修改
                                </p>
                            </div>
                        </div>
                        <div class="desc_for_world cluster_desc_item hide" id="content2_server_world">
                            <div>
                                <p class="cluster_desc_text">
                                    世界设置
                                </p>
                                <p class="cluster_desc_text">
                                    这里的选项很危险，没事不要改
                                </p>
                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：[Host]'s World
                                </p>
                            </div>
                        </div>
                        <div class="desc_for_world cluster_desc_item hide" id="content2_server_port_world">
                            <div>
                                <p class="cluster_desc_text">
                                    服务器端口
                                </p>
                                <p class="cluster_desc_text">
                                    服务器监听的 UDP 端口，每个服务器需要设置不同的端口<br>
                                    范围：10998-11018 (其它端口也可，但游戏在检索局域网房间时只会扫描这些端口)<br><br>
                                    页面自动分配的端口不会与已填写的端口重复，但页面不会擅自修改自行填写的端口，所以确保不要填写重复的端口。
                                </p>
                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：10998-11018
                                </p>
                            </div>
                        </div>
                        <div class="desc_for_world cluster_desc_item hide" id="content2_is_master_world">
                            <div>
                                <p class="cluster_desc_text">
                                    主服务器
                                </p>
                                <p class="cluster_desc_text">
                                    将该世界设为主世界，即第一次进入房间时将会进入的世界。<br>
                                    主服务器运行的是一个房间的核心世界，其它世界都是该世界的附属，比如季节、天数等都是以该世界为准的。<br><br>
                                    双击可将该世界设为主世界，主世界不可删除，如果对饥荒服务器没有足够的了解请不要修改主世界。
                                </p>
                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：无
                                </p>
                            </div>
                        </div>
                        <div class="desc_for_world cluster_desc_item hide" id="content2_name_world">
                            <div>
                                <p class="cluster_desc_text">
                                    世界名
                                </p>
                                <p class="cluster_desc_text">
                                    从服务器显示在日志中的名称。<br>
                                    主服务器使用名称[SHDMASTER]，不需要设置
                                </p>
                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：无
                                </p>
                            </div>
                        </div>
                        <div class="desc_for_world cluster_desc_item hide" id="content2_id_world">
                            <div>
                                <p class="cluster_desc_text">
                                    世界 ID
                                </p>
                                <p class="cluster_desc_text">
                                    随机数字，用于区分不同的从服务器。<br>
                                    游戏过程中修改该项会导致该世界的玩家信息丢失。<br>
                                    主服务器强制为 1。其它世界设为 1 也会被视为主服务器去新注册一个房间。
                                </p>
                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：无
                                </p>
                            </div>
                        </div>
                        <div class="desc_for_world cluster_desc_item hide" id="content2_encode_user_path_world">
                            <div>
                                <p class="cluster_desc_text">
                                    路径兼容
                                </p>
                                <p class="cluster_desc_text">
                                    使路径编码与不区分大小写的操作系统兼容
                                </p>
                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：开启
                                </p>
                            </div>
                        </div>
                        <div class="desc_for_world cluster_desc_item hide" id="content2_authentication_port_world">
                            <div>
                                <p class="cluster_desc_text">
                                    认证端口
                                </p>
                                <p class="cluster_desc_text">
                                    STEAM使用的内部端口。为什么说的这么含糊，因为我也不知道这个端口有什么用，服务器实际运行过程中并没有使用这个端口。<br>
                                    每个服务器需要设置不同的端口。<br><br>
                                    页面自动分配的端口不会与已填写的端口重复，但页面不会擅自修改自行填写的端口，所以确保不要填写重复的端口。

                                </p>
                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：8766
                                </p>
                            </div>
                        </div>
                        <div class="desc_for_world cluster_desc_item hide" id="content2_master_server_port_world">
                            <div>
                                <p class="cluster_desc_text">
                                    世界端口
                                </p>
                                <p class="cluster_desc_text">
                                    STEAM使用的内部端口。为什么说的这么含糊，因为我也不知道这个端口有什么用，服务器实际运行过程中并没有使用这个端口。<br>
                                    每个服务器需要设置不同的端口。<br><br>
                                    页面自动分配的端口不会与已填写的端口重复，但页面不会擅自修改自行填写的端口，所以确保不要填写重复的端口。
                                </p>
                            </div>
                            <div>
                                <p class="cluster_desc_text">
                                    默认：27016
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="world focus_item focus_edit world_edit hide show" id="content_placeholder">
                <div class="cluster_title">
                    <h4 class="cluster_title_con">嘿，看上去你遇到了一点问题，你最好在浏览器爆炸之前刷新页面</h4>
                </div>
            </div>

        </div>
    </div>


    <div class="main_content hide" id="content_mod">
        <div class="content_item content_sidebar">
            <div class="cluster_title">
                <h4 class="cluster_title_con">模组设置</h4>
            </div>
            <div class="world_sidebar_con" id="mod_sidebar">
                <div class="world_sidebar_button_div">
                    <button class="mod world_sidebar_button show_button active" id="button_mod_common">通用</button>
                </div>
            </div>
        </div>
        <div class="content_item content_focus reverse hide just_show" id="mod_list">
            <div class="focus_item focus_desc">
                <div class="cluster_title">
                    <h4 class="cluster_title_con">模组添加</h4>
                </div>

                <div class="cluster_item_con desc_items">
                    <div class="cluster_item_list desc_item_list mod_desc_list" id="mod_result_list">
                        <div class="mod_card" id="mod_search_start">看下面，你可以<br>输入关键字搜索 mod<br>输入 mod id 添加 mod</div>
                        <div class="mod_card hide" id="mod_searching">在搜索了<dot>...</dot></div>
                        <div class="mod_card hide" id="mod_search_failed">不好，搜索失败了</div>
                        <div class="mod_card hide" id="mod_search_none">没有找到 mod</div>
                        <div class="desc_for_mod cluster_desc_item mod_desc_item hide" id="content_mod_select">
                            <div class="mod_card">
                                <div class="mod_card_img" style="background-image: url('/misc/idk.png')"><div class="mod_card_img_add" onclick="">添加<br>模组</div></div>
                                <div class="mod_card_info">
                                    <div class="mod_card_info_item" title="无用无无无无">我的模组</div>
                                    <div class="mod_card_info_item" title="mod id 点击查看 steam 页面"><a class="normal_link" href="#emoji_bar" target="_blank">2206282028</a></div>
                                    <div class="mod_card_info_item" title="评分">★★★★☆</div>
                                    <div class="mod_card_info_item" title="作者 点击查看主页"><a class="normal_link" href="" target="_top">suke</a></div>
                                    <div class="mod_card_info_item" title="订阅数量">⚐0</div>
                                    <div class="mod_card_info_item" title="最后更新时间">22-03-02 00:49:07</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="desc_input_div_div">
                    <div class="desc_input_div">
                        <label class="desc_label" for="mod_search_add">
                            <button class="desc_button" id="mod_add"
                                    onclick="add_mod_to_world(document.getElementById('mod_search_add').value);">添加
                            </button>
                        </label>
                        <input class="desc_input" id="mod_search_add" placeholder='输入 ID 或搜索词'>
                        <label class="desc_label" for="mod_search_add">
                            <button class="desc_button" id="mod_search"
                                    onclick="search_event()">搜索
                            </button>
                        </label>

                    </div>

                </div>


            </div>

            <div class="mod_edit focus_item focus_edit hide show" id="content_mod_common">
                <div class="cluster_title">
                    <h4 class="cluster_title_con">通用模组</h4>
                </div>

                <div class="mod_edit_con">
                    <div class="mod_edit_tips_part close">
                        <div>
                            通用：每个世界都会添加通用部分的 mod。<br>
                            如果需要单独为某个世界配置专属 mod，点击对应世界进行配置。<br>
                            如果通用与专属中有相同的mod，优先使用专属设置。<br>
                            <span style="color: #ff3333">
                                仅提供模组设置修改功能，极少数 mod 如 熔炉 等会修改世界选项，不支持这种对世界选项的修改
                            </span>
                        </div>
                        <div class="mod_edit_tip_close">――</div>
                    </div>
                    <div class="mod_edit_info_part" id="mod_common_info_part">
                        <div class="mod_button_list" id="mod_common_button_list">
                            <div class="mod_card mod_button placeholder"><p class="mod_button_detail placeholder">没有 mod</p></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>




    <div class="main_content done_con hide" id="content_done">


        <button onclick="lets_go()">创建存档</button>
    </div>



</div>

<div class="bar" id="bar">
    <div class="bar_div emoji_text">
        󰀐
        <!--    <div id="tip_left">-->
        <!--        你好-->
        <!--    </div>-->
    </div>
    <div class="bar_div">
        <button class="bar_button show_button" id="button_readme" type="button">&ensp;关&emsp;于&ensp;</button>
    </div>
    <div class="bar_div">
        <button class="bar_button show_button" id="button_cluster_setting" type="button">房间设置</button>
    </div>
    <div class="bar_div">
        <button class="bar_button show_button" id="button_world" type="button">世界设置</button>
    </div>
    <div class="bar_div">
        <button class="bar_button show_button" id="button_mod" type="button">模组设置</button>
    </div>
    <div class="bar_div">
        <button class="bar_button show_button" id="button_done" type="button">&ensp;完&emsp;成&ensp;</button>
    </div>
    <div class="bar_div emoji_text">
        󰀐
    </div>
</div>
<button id="light bulb" onclick="light()"></button>
</body>
</html>
<script>
    window.onload = function () {
        onload_1();
    }
</script>
