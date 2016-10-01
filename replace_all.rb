def acerta_jira(ci,jira)
	c = Ci.find_by_chave(ci)
	if c
		if c.jira.include? jira 
			puts "CI #{ci} ja possui jira pai: #{c.jira}"
		else
		 	c.jira = "#{jira},#{c.jira}"
		end
	else
		puts "CI nao achado #{ci}"
	end
end

acerta_jira("ADPROD199MAL","JIRA_PAI|INFRA-2959")
acerta_jira("adprod201alpha","JIRA_PAI|INFRA-2960")
acerta_jira("ADPROD201BV","JIRA_PAI|INFRA-2961")
acerta_jira("ADPROD201DF","JIRA_PAI|INFRA-2962")
acerta_jira("ADPROD201PP","JIRA_PAI|INFRA-2963")
acerta_jira("ADPROD201REC","JIRA_PAI|INFRA-2964")
acerta_jira("ADPROD201TEO","JIRA_PAI|INFRA-2965")
acerta_jira("ADPROD202MAL","JIRA_PAI|INFRA-2966")
acerta_jira("ADPROD202TEO","JIRA_PAI|INFRA-2967")
acerta_jira("adprod206bv","JIRA_PAI|INFRA-2968")
acerta_jira("ADPROD206BV-POCSAMBA","JIRA_PAI|INFRA-2969")
acerta_jira("ADPROD208BV","JIRA_PAI|INFRA-2970")
acerta_jira("ADPROD208BV-POCSAMBA","JIRA_PAI|INFRA-2971")
acerta_jira("ALPHASERVER10","JIRA_PAI|INFRA-2972")
acerta_jira("ALPHASERVER14","JIRA_PAI|INFRA-2973")
acerta_jira("ALPHASERVER15","JIRA_PAI|INFRA-2974")
acerta_jira("ALPHASERVER17","JIRA_PAI|INFRA-2975")
acerta_jira("ALPHASERVER6","JIRA_PAI|INFRA-2976")
acerta_jira("ALPHASRVESX250","JIRA_PAI|INFRA-2977")
acerta_jira("biproddb6","JIRA_PAI|INFRA-2978")
acerta_jira("BVCEFSRV03","JIRA_PAI|INFRA-2979")
acerta_jira("BVSERVER12","JIRA_PAI|INFRA-2980")
acerta_jira("BVSERVER7","JIRA_PAI|INFRA-2981")
acerta_jira("cefdesapp170","JIRA_PAI|INFRA-2982")
acerta_jira("CitrixProd100","JIRA_PAI|INFRA-2983")
acerta_jira("CitrixProd102","JIRA_PAI|INFRA-2984")
acerta_jira("CitrixProd103","JIRA_PAI|INFRA-2985")
acerta_jira("CitrixProd104","JIRA_PAI|INFRA-2986")
acerta_jira("CitrixProd105","JIRA_PAI|INFRA-2987")
acerta_jira("CitrixProd106","JIRA_PAI|INFRA-2988")
acerta_jira("CitrixProd108","JIRA_PAI|INFRA-2989")
acerta_jira("CitrixProd109","JIRA_PAI|INFRA-2990")
acerta_jira("CitrixProd110","JIRA_PAI|INFRA-2991")
acerta_jira("CitrixProd112","JIRA_PAI|INFRA-2992")
acerta_jira("CitrixProd140","JIRA_PAI|INFRA-2993")
acerta_jira("CitrixProdRM01","JIRA_PAI|INFRA-2994")
acerta_jira("CitrixprodRM02","JIRA_PAI|INFRA-2995")
acerta_jira("CitrixprodRM03","JIRA_PAI|INFRA-2996")
acerta_jira("CitrixprodRM04","JIRA_PAI|INFRA-2997")
acerta_jira("CitrixprodRM05","JIRA_PAI|INFRA-2998")
acerta_jira("CitrixprodRM06","JIRA_PAI|INFRA-2999")
acerta_jira("CitrixprodRM07","JIRA_PAI|INFRA-3000")
acerta_jira("CitrixprodRM08","JIRA_PAI|INFRA-3001")
acerta_jira("CitrixprodRM09","JIRA_PAI|INFRA-3002")
acerta_jira("CitrixprodRM10","JIRA_PAI|INFRA-3003")
acerta_jira("CitrixprodRM11","JIRA_PAI|INFRA-3004")
acerta_jira("CitrixprodRM12","JIRA_PAI|INFRA-3005")
acerta_jira("CitrixprodRM13","JIRA_PAI|INFRA-3006")
acerta_jira("CitrixprodRM14","JIRA_PAI|INFRA-3007")
acerta_jira("CitrixprodRM15","JIRA_PAI|INFRA-3008")
acerta_jira("CitrixprodRM16","JIRA_PAI|INFRA-3009")
acerta_jira("CitrixprodRM17","JIRA_PAI|INFRA-3010")
acerta_jira("CitrixprodRM18","JIRA_PAI|INFRA-3011")
acerta_jira("CitrixprodRM19","JIRA_PAI|INFRA-3012")
acerta_jira("CitrixprodRM22","JIRA_PAI|INFRA-3013")
acerta_jira("CWBSRVESX248","JIRA_PAI|INFRA-3014")
acerta_jira("CWBSRVESX251","JIRA_PAI|INFRA-3015")
acerta_jira("CWBSRVESX253","JIRA_PAI|INFRA-3016")
acerta_jira("DFSERVER208","JIRA_PAI|INFRA-3017")
acerta_jira("DFSERVER228","JIRA_PAI|INFRA-3018")
acerta_jira("DFSERVER4","JIRA_PAI|INFRA-3019")
acerta_jira("DFSRVCEF206","JIRA_PAI|INFRA-3020")
acerta_jira("DFSRVCEF209","JIRA_PAI|INFRA-3021")
acerta_jira("DFSRVCEF215","JIRA_PAI|INFRA-3022")
acerta_jira("DFSRVCEF223","JIRA_PAI|INFRA-3023")
acerta_jira("DFSRVESX251","JIRA_PAI|INFRA-3024")
acerta_jira("DNS1","JIRA_PAI|INFRA-3025")
acerta_jira("DNS2","JIRA_PAI|INFRA-3026")
acerta_jira("DT10222","JIRA_PAI|INFRA-3027")
acerta_jira("FWAlpha","JIRA_PAI|INFRA-3028")
acerta_jira("FWCWB","JIRA_PAI|INFRA-3029")
acerta_jira("FWDF","JIRA_PAI|INFRA-3030")
acerta_jira("FWPP","JIRA_PAI|INFRA-3031")
acerta_jira("FWREC","JIRA_PAI|INFRA-3032")
acerta_jira("InstantRec01","JIRA_PAI|INFRA-3033")
acerta_jira("InstantRec02","JIRA_PAI|INFRA-3034")
acerta_jira("InstantRJ","JIRA_PAI|INFRA-3035")
acerta_jira("iv-brq-pbxbv","JIRA_PAI|INFRA-3036")
acerta_jira("iv-brq-pbxmal","JIRA_PAI|INFRA-3037")
acerta_jira("linuxmon","JIRA_PAI|INFRA-3038")
acerta_jira("MALCEFSRV01","JIRA_PAI|INFRA-3039")
acerta_jira("MALSERVER4","JIRA_PAI|INFRA-3040")
acerta_jira("MALSERVER44","JIRA_PAI|INFRA-3041")
acerta_jira("malserver47","JIRA_PAI|INFRA-3042")
acerta_jira("malserver4teste","JIRA_PAI|INFRA-3043")
acerta_jira("MALSERVER8","JIRA_PAI|INFRA-3044")
acerta_jira("MALSERVER9","JIRA_PAI|INFRA-3045")
acerta_jira("portalprodapp13","JIRA_PAI|INFRA-3046")
acerta_jira("portalprodapp15","JIRA_PAI|INFRA-3047")
acerta_jira("portalproddb14","JIRA_PAI|INFRA-3048")
acerta_jira("PPSERVER3","JIRA_PAI|INFRA-3049")
acerta_jira("PPSRVESX251","JIRA_PAI|INFRA-3050")
acerta_jira("PPSRVESX252","JIRA_PAI|INFRA-3051")
acerta_jira("RECSERVER6","JIRA_PAI|INFRA-3052")
acerta_jira("RECSERVER8","JIRA_PAI|INFRA-3053")
acerta_jira("RECSRVESX253","JIRA_PAI|INFRA-3054")
acerta_jira("RECSRVESX254","JIRA_PAI|INFRA-3055")
acerta_jira("Riverbed_RBT_DVA","JIRA_PAI|INFRA-3056")
acerta_jira("RJSERVER103","JIRA_PAI|INFRA-3057")
acerta_jira("RJSERVER111","JIRA_PAI|INFRA-3058")
acerta_jira("RJSERVER117","JIRA_PAI|INFRA-3059")
acerta_jira("RJSERVER12","JIRA_PAI|INFRA-3060")
acerta_jira("RJSERVER136","JIRA_PAI|INFRA-3061")
acerta_jira("RJSERVER144","JIRA_PAI|INFRA-3062")
acerta_jira("RJSERVER152","JIRA_PAI|INFRA-3063")
acerta_jira("RJSERVER160","JIRA_PAI|INFRA-3064")
acerta_jira("RJSERVER162","JIRA_PAI|INFRA-3065")
acerta_jira("RJSERVER18","JIRA_PAI|INFRA-3066")
acerta_jira("RJSERVER184","JIRA_PAI|INFRA-3067")
acerta_jira("RJSERVER2","JIRA_PAI|INFRA-3068")
acerta_jira("RJSERVER221","JIRA_PAI|INFRA-3069")
acerta_jira("RJSERVER3","JIRA_PAI|INFRA-3070")
acerta_jira("RJSERVER83","JIRA_PAI|INFRA-3071")
acerta_jira("rjserver89","JIRA_PAI|INFRA-3072")
acerta_jira("RJSERVER99","JIRA_PAI|INFRA-3073")
acerta_jira("RJSRVDB251","JIRA_PAI|INFRA-3074")
acerta_jira("RJSRVDB251OL","JIRA_PAI|INFRA-3075")
acerta_jira("RJSRVSAPD155","JIRA_PAI|INFRA-3076")
acerta_jira("RJSRVSAPQA190","JIRA_PAI|INFRA-3077")
acerta_jira("RJSRVSAPQA226","JIRA_PAI|INFRA-3078")
acerta_jira("RJSRVSAPQD227","JIRA_PAI|INFRA-3079")
acerta_jira("RMPRODAPP2","JIRA_PAI|INFRA-3080")
acerta_jira("RMPRODJOB21","JIRA_PAI|INFRA-3081")
acerta_jira("RMPRODKEY5","JIRA_PAI|INFRA-3082")
acerta_jira("sapdev11","JIRA_PAI|INFRA-3083")
acerta_jira("SAPPROD1","JIRA_PAI|INFRA-3084")
acerta_jira("sassubversion","JIRA_PAI|INFRA-3085")
acerta_jira("SIPRODAPP4","JIRA_PAI|INFRA-3086")
acerta_jira("SIPRODDB3","JIRA_PAI|INFRA-3087")
acerta_jira("SPSERVER078","JIRA_PAI|INFRA-3088")
acerta_jira("SPSERVER109","JIRA_PAI|INFRA-3089")
acerta_jira("SPSERVER140","JIRA_PAI|INFRA-3090")
acerta_jira("SPSERVER148","JIRA_PAI|INFRA-3091")
acerta_jira("SPSERVER149","JIRA_PAI|INFRA-3092")
acerta_jira("SPSERVER16","JIRA_PAI|INFRA-3093")
acerta_jira("SPSERVER193","JIRA_PAI|INFRA-3094")
acerta_jira("spserver196","JIRA_PAI|INFRA-3095")
acerta_jira("SPSERVER199","JIRA_PAI|INFRA-3096")
acerta_jira("SPSERVER233","JIRA_PAI|INFRA-3097")
acerta_jira("SPSERVER248","JIRA_PAI|INFRA-3098")
acerta_jira("SPSERVER250","JIRA_PAI|INFRA-3099")
acerta_jira("SPSERVER7","JIRA_PAI|INFRA-3100")
acerta_jira("SPSERVER93","JIRA_PAI|INFRA-3101")
acerta_jira("SPSERVER94","JIRA_PAI|INFRA-3102")
acerta_jira("SPSRVESX232","JIRA_PAI|INFRA-3103")
acerta_jira("SPSRVESX233","JIRA_PAI|INFRA-3104")
acerta_jira("SPSRVESX234","JIRA_PAI|INFRA-3105")
acerta_jira("SPSRVESX236","JIRA_PAI|INFRA-3106")
acerta_jira("SPSRVESX237","JIRA_PAI|INFRA-3107")
acerta_jira("SPSRVESX238","JIRA_PAI|INFRA-3108")
acerta_jira("SPSRVESX239","JIRA_PAI|INFRA-3109")
acerta_jira("SPSRVESX240","JIRA_PAI|INFRA-3110")
acerta_jira("SPSRVESX241","JIRA_PAI|INFRA-3111")
acerta_jira("SPSRVESX242","JIRA_PAI|INFRA-3112")
acerta_jira("SPSRVESX243","JIRA_PAI|INFRA-3113")
acerta_jira("SPSRVESX244","JIRA_PAI|INFRA-3114")
acerta_jira("SPSRVESX245","JIRA_PAI|INFRA-3115")
acerta_jira("SPSRVESX246","JIRA_PAI|INFRA-3116")
acerta_jira("SPSRVESX247","JIRA_PAI|INFRA-3117")
acerta_jira("SPSRVESX248","JIRA_PAI|INFRA-3118")
acerta_jira("SPSRVESX249","JIRA_PAI|INFRA-3119")
acerta_jira("SPSRVESX250","JIRA_PAI|INFRA-3120")
acerta_jira("SPSRVESX251","JIRA_PAI|INFRA-3121")
acerta_jira("SPSRVESX252","JIRA_PAI|INFRA-3122")
acerta_jira("SPSRVESX253","JIRA_PAI|INFRA-3123")
acerta_jira("SPSRVESX254","JIRA_PAI|INFRA-3124")
acerta_jira("srv1038","JIRA_PAI|INFRA-3125")
acerta_jira("SRV1042","JIRA_PAI|INFRA-3126")
acerta_jira("srv1072","JIRA_PAI|INFRA-3127")
acerta_jira("srv1074","JIRA_PAI|INFRA-3128")
acerta_jira("srv12238","JIRA_PAI|INFRA-3129")
acerta_jira("srv12239","JIRA_PAI|INFRA-3130")
acerta_jira("srv12240","JIRA_PAI|INFRA-3131")
acerta_jira("srv12241","JIRA_PAI|INFRA-3132")
acerta_jira("srv12242","JIRA_PAI|INFRA-3133")
acerta_jira("srv12243","JIRA_PAI|INFRA-3134")
acerta_jira("SRV12421","JIRA_PAI|INFRA-3135")
acerta_jira("srv1257","JIRA_PAI|INFRA-3136")
acerta_jira("SRV12719","JIRA_PAI|INFRA-3137")
acerta_jira("srv12723","JIRA_PAI|INFRA-3138")
acerta_jira("SRV12769","JIRA_PAI|INFRA-3139")
acerta_jira("srv12886","JIRA_PAI|INFRA-3140")
acerta_jira("srv12944","JIRA_PAI|INFRA-3141")
acerta_jira("srv1302","JIRA_PAI|INFRA-3142")
acerta_jira("srv1303","JIRA_PAI|INFRA-3143")
acerta_jira("srv1304","JIRA_PAI|INFRA-3144")
acerta_jira("srv1309","JIRA_PAI|INFRA-3145")
acerta_jira("SRV13101","JIRA_PAI|INFRA-3146")
acerta_jira("SRV13105","JIRA_PAI|INFRA-3147")
acerta_jira("srv1369","JIRA_PAI|INFRA-3148")
acerta_jira("srv1371","JIRA_PAI|INFRA-3149")
acerta_jira("srv14232","JIRA_PAI|INFRA-3150")
acerta_jira("srv14240","JIRA_PAI|INFRA-3151")
acerta_jira("srv14415","JIRA_PAI|INFRA-3152")
acerta_jira("srv14430","JIRA_PAI|INFRA-3153")
acerta_jira("srv1456","JIRA_PAI|INFRA-3154")
acerta_jira("SRV14565","JIRA_PAI|INFRA-3155")
acerta_jira("SRV1505","JIRA_PAI|INFRA-3156")
acerta_jira("srv15480","JIRA_PAI|INFRA-3157")
acerta_jira("srv15504","JIRA_PAI|INFRA-3158")
acerta_jira("srv15521","JIRA_PAI|INFRA-3159")
acerta_jira("SRV15522","JIRA_PAI|INFRA-3160")
acerta_jira("srv15528","JIRA_PAI|INFRA-3161")
acerta_jira("SRV15590","JIRA_PAI|INFRA-3162")
acerta_jira("srv15594","JIRA_PAI|INFRA-3163")
acerta_jira("SRV15622","JIRA_PAI|INFRA-3164")
acerta_jira("srv15629","JIRA_PAI|INFRA-3165")
acerta_jira("srv15635","JIRA_PAI|INFRA-3166")
acerta_jira("SRV15637","JIRA_PAI|INFRA-3167")
acerta_jira("srv15764","JIRA_PAI|INFRA-3168")
acerta_jira("srv15784","JIRA_PAI|INFRA-3169")
acerta_jira("srv15792","JIRA_PAI|INFRA-3170")
acerta_jira("srv15797","JIRA_PAI|INFRA-3171")
acerta_jira("SRV15799","JIRA_PAI|INFRA-3172")
acerta_jira("srv15800","JIRA_PAI|INFRA-3173")
acerta_jira("srv15812","JIRA_PAI|INFRA-3174")
acerta_jira("srv15874","JIRA_PAI|INFRA-3175")
acerta_jira("srv15878","JIRA_PAI|INFRA-3176")
acerta_jira("srv15881","JIRA_PAI|INFRA-3177")
acerta_jira("srv15882","JIRA_PAI|INFRA-3178")
acerta_jira("srv15883","JIRA_PAI|INFRA-3179")
acerta_jira("SRV16252","JIRA_PAI|INFRA-3180")
acerta_jira("srv16296","JIRA_PAI|INFRA-3181")
acerta_jira("srv16330","JIRA_PAI|INFRA-3182")
acerta_jira("SRV16336","JIRA_PAI|INFRA-3183")
acerta_jira("SRV16455","JIRA_PAI|INFRA-3184")
acerta_jira("srv16457","JIRA_PAI|INFRA-3185")
acerta_jira("srv16532","JIRA_PAI|INFRA-3186")
acerta_jira("srv16567","JIRA_PAI|INFRA-3187")
acerta_jira("srv16591","JIRA_PAI|INFRA-3188")
acerta_jira("SRV16604","JIRA_PAI|INFRA-3189")
acerta_jira("SRV16686","JIRA_PAI|INFRA-3190")
acerta_jira("srv16693","JIRA_PAI|INFRA-3191")
acerta_jira("srv16734","JIRA_PAI|INFRA-3192")
acerta_jira("srv16759","JIRA_PAI|INFRA-3193")
acerta_jira("srv16773","JIRA_PAI|INFRA-3194")
acerta_jira("SRV16774","JIRA_PAI|INFRA-3195")
acerta_jira("SRV16780","JIRA_PAI|INFRA-3196")
acerta_jira("SRV16781","JIRA_PAI|INFRA-3197")
acerta_jira("srv16788","JIRA_PAI|INFRA-3198")
acerta_jira("srv16799","JIRA_PAI|INFRA-3199")
acerta_jira("srv16800","JIRA_PAI|INFRA-3200")
acerta_jira("srv16808","JIRA_PAI|INFRA-3201")
acerta_jira("SRV16843","JIRA_PAI|INFRA-3202")
acerta_jira("SRV16851","JIRA_PAI|INFRA-3203")
acerta_jira("SRV16856","JIRA_PAI|INFRA-3204")
acerta_jira("SRV16859","JIRA_PAI|INFRA-3205")
acerta_jira("SRV16869","JIRA_PAI|INFRA-3206")
acerta_jira("srv16872","JIRA_PAI|INFRA-3207")
acerta_jira("srv16896","JIRA_PAI|INFRA-3208")
acerta_jira("srv16920","JIRA_PAI|INFRA-3209")
acerta_jira("srv17032","JIRA_PAI|INFRA-3210")
acerta_jira("srv17035","JIRA_PAI|INFRA-3211")
acerta_jira("srv17046","JIRA_PAI|INFRA-3212")
acerta_jira("srv17047","JIRA_PAI|INFRA-3213")
acerta_jira("srv17102","JIRA_PAI|INFRA-3214")
acerta_jira("srv17103","JIRA_PAI|INFRA-3215")
acerta_jira("srv17104","JIRA_PAI|INFRA-3216")
acerta_jira("srv17105","JIRA_PAI|INFRA-3217")
acerta_jira("srv17142","JIRA_PAI|INFRA-3218")
acerta_jira("srv17145","JIRA_PAI|INFRA-3219")
acerta_jira("srv17147","JIRA_PAI|INFRA-3220")
acerta_jira("srv17208","JIRA_PAI|INFRA-3221")
acerta_jira("srv17212","JIRA_PAI|INFRA-3222")
acerta_jira("srv17215","JIRA_PAI|INFRA-3223")
acerta_jira("srv17220","JIRA_PAI|INFRA-3224")
acerta_jira("srv17223","JIRA_PAI|INFRA-3225")
acerta_jira("srv17225","JIRA_PAI|INFRA-3226")
acerta_jira("srv17238","JIRA_PAI|INFRA-3227")
acerta_jira("srv17246","JIRA_PAI|INFRA-3228")
acerta_jira("srv17257","JIRA_PAI|INFRA-3229")
acerta_jira("srv17260","JIRA_PAI|INFRA-3230")
acerta_jira("srv17261","JIRA_PAI|INFRA-3231")
acerta_jira("srv17265","JIRA_PAI|INFRA-3232")
acerta_jira("srv17266","JIRA_PAI|INFRA-3233")
acerta_jira("srv17275","JIRA_PAI|INFRA-3234")
acerta_jira("srv17298","JIRA_PAI|INFRA-3235")
acerta_jira("srv17347","JIRA_PAI|INFRA-3236")
acerta_jira("srv2450","JIRA_PAI|INFRA-3237")
acerta_jira("srv2489","JIRA_PAI|INFRA-3238")
acerta_jira("srv2783","JIRA_PAI|INFRA-3239")
acerta_jira("srv2994","JIRA_PAI|INFRA-3240")
acerta_jira("srv3041","JIRA_PAI|INFRA-3241")
acerta_jira("srv3198","JIRA_PAI|INFRA-3242")
acerta_jira("srv3226","JIRA_PAI|INFRA-3243")
acerta_jira("srv3233","JIRA_PAI|INFRA-3244")
acerta_jira("srv3276","JIRA_PAI|INFRA-3245")
acerta_jira("srv361","JIRA_PAI|INFRA-3246")
acerta_jira("srv4563","JIRA_PAI|INFRA-3247")
acerta_jira("srv4708","JIRA_PAI|INFRA-3248")
acerta_jira("srv4709","JIRA_PAI|INFRA-3249")
acerta_jira("srv4913","JIRA_PAI|INFRA-3250")
acerta_jira("srv4914","JIRA_PAI|INFRA-3251")
acerta_jira("srv4996","JIRA_PAI|INFRA-3252")
acerta_jira("srv4997","JIRA_PAI|INFRA-3253")
acerta_jira("SRV5001","JIRA_PAI|INFRA-3254")
acerta_jira("SRV5005","JIRA_PAI|INFRA-3255")
acerta_jira("srv5016","JIRA_PAI|INFRA-3256")
acerta_jira("srv5023","JIRA_PAI|INFRA-3257")
acerta_jira("srv5024","JIRA_PAI|INFRA-3258")
acerta_jira("SRV6026","JIRA_PAI|INFRA-3259")
acerta_jira("srv6027","JIRA_PAI|INFRA-3260")
acerta_jira("SRV771","JIRA_PAI|INFRA-3261")
acerta_jira("SRV772","JIRA_PAI|INFRA-3262")
acerta_jira("srv947","JIRA_PAI|INFRA-3263")
acerta_jira("srv9520","JIRA_PAI|INFRA-3264")
acerta_jira("srv9580","JIRA_PAI|INFRA-3265")
acerta_jira("srv9595","JIRA_PAI|INFRA-3266")
acerta_jira("srv9996","JIRA_PAI|INFRA-3267")
acerta_jira("SugarCRM","JIRA_PAI|INFRA-3268")
acerta_jira("TEOSRVESX244","JIRA_PAI|INFRA-3269")
acerta_jira("WSUSPROD102BV","JIRA_PAI|INFRA-3270")
acerta_jira("WSUSPROD207REC","JIRA_PAI|INFRA-3271)