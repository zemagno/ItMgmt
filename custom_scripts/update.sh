#/bin/bash
if [ "$1" == "" ]; then
   echo "update <versao Branch>";
   exit;
fi
VERSAO=$(date '+%Y%m%d_%H%M')
TARGET=ItMgmt.v$VERSAO
cd ~
git clone -b $1 ssh://git@gitlab.com/zemagno/ItMgmt.git $TARGET
# mkdir -p gam/public/images
#cp gam/config/application.rb $TARGET/config/
cp gam/config/database.yml $TARGET/config/
cp gam/config/itam.yml $TARGET/config/
cp gam/config/sidekiq.yml $TARGET/config/
cp gam/config/thinking_sphinx.yml $TARGET/config/
cp gam/Passenger.json $TARGET/
#ln -sf ItMgmt.v$Versao gam
cd $TARGET
mkdir tmp
mkdir tmp/pids
gem install bundle
bundle install
rake db:migrate
rake assets:precompile
rake assets:precompile
rake ts:clear_rt
rake ts:clear
rake ts:configure
rake ts:regenerate
# custom_scripts/fix_it_all.bash