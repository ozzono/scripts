test_up(){
    config=$(openvpn3 configs-list|grep net) # example: /net/openvpn/v3/configuration/277cb770x20bex4f67xb1ecxbbe5e7d6daf3
    if [[ -z "$config"  ]]; then
        echo "\$openvpn3 not yet configured"
        openvpn3 config-import /home/flinks/.config/openvpn/client.ovpn
        vpn-up
    else
        cat /home/flinks/.config/openvpn/.autoload | xclip -selection clipboard && openvpn3 session-start --config-path $config
    fi
}